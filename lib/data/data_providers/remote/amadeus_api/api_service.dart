import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:virtual_traveller_flutter/config/app/debug_config.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/secrets.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';

class ApiService {
  static const _apiKey = Secrets.amadeusApiKey;
  static const _secretKey = Secrets.amadeusSecretKey;

  static const _baseUrl =
      DebugConfig.productionMode ? 'api.amadeus.com' : 'test.api.amadeus.com';

  static const _authUrl =
      'https://test.api.amadeus.com/v1/security/oauth2/token';

  String _accessToken;

  String get accessToken => _accessToken;

  // https://developers.amadeus.com/self-service/apis-docs/guides/authorization-262
  Future<String> getAccessToken() async {
    final response = await http.post(
      Uri.parse(_authUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body:
          'grant_type=client_credentials&client_id=${_apiKey}&client_secret=${_secretKey}',
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final accessToken = data['access_token'];

      if (accessToken != null) {
        print('Token request successful: $accessToken');
        return accessToken;
      }
    }

    print(
      'Token request failed\n'
      'status code: ${response.statusCode}\n'
      'reason phrase: ${response.reasonPhrase}\n'
      'body: ${response.body}',
    );
    throw response;
  }

  /// Checks if the [_accessToken] is not null and is still valid.
  ///
  /// If:
  ///   - statusCode = 401 = UNAUTHORIZED = Access Token has expired -> generate a new one
  Future<T> checkTokenValidation<T>(Future<T> Function() onChecked) async {
    try {
      _accessToken ??= await getAccessToken();
      return await onChecked();
    } on http.Response catch (response) {
      if (response.statusCode == 401) {
        print('token expired, requesting a new one');
        _accessToken = await getAccessToken();
        return await onChecked();
      }
      rethrow;
    }
  }

  /// Fetches the given network call with query parameters.
  ///
  /// First checks whether accessToken is still valid otherwise
  /// generate a new one.
  Future<String> getRawDataFromEndpoint(
    String endpointPath,
    Map<String, dynamic> queryParams,
  ) async {
    final apiCallFunc = () async {
      final valueSafeMap = <String, String>{};
      queryParams.forEach((key, value) {
        if (value != null) {
          valueSafeMap[key] =
              value is List ? value.toCommaString() : value.toString();
        }
      });
      queryParams = valueSafeMap;

      final uri = getUri(endpointPath, queryParams);
      final response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer ${accessToken}',
        },
      );

      print(
        'Request ${uri.toString()} with token: ${accessToken}\n'
        'Response: ${response.statusCode}: ${response.reasonPhrase}',
      );

      if (response.statusCode == 200) {
        return response.body;
      }

      throw (response);
    };

    try {
      return checkTokenValidation(apiCallFunc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Uri getUri(String endpointPath, [Map<String, String> queryParams]) {
    return Uri(
      scheme: 'https',
      host: _baseUrl,
      path: endpointPath,
      queryParameters: queryParams,
    );
  }
}
