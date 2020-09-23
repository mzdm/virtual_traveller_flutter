import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:virtual_traveller_flutter/data/data_providers/remote/secrets.dart';
import 'package:virtual_traveller_flutter/utils/debug_options.dart';

class ApiService {
  static const _apiKey = Secrets.amadeusApiKey;
  static const _secretKey = Secrets.amadeusSecretKey;


  static const _baseUrl = DebugOptions.productionMode
      ? 'api.amadeus.com'
      : 'test.api.amadeus.com';

  static const _authUrl = 'https://test.api.amadeus.com/v1/security/oauth2/token';

  // https://developers.amadeus.com/self-service/apis-docs/guides/authorization-262
  Future<String> getAccessToken() async {
    final response = await http.post(
      _authUrl,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: 'grant_type=client_credentials&client_id=${_apiKey}&client_secret=${_secretKey}',
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

  Uri getUri(String endpointPath, [Map<String, dynamic> queryParams]) {
    return Uri(
      scheme: 'https',
      host: _baseUrl,
      path: endpointPath,
      queryParameters: queryParams,
    );
  }
}
