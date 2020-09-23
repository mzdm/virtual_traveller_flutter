import 'package:flutter/foundation.dart';
import 'package:virtual_traveller_flutter/data/data_providers/remote/amadeus_api/data.dart';

class AmadeusMockedDataProvider {
  Future<T> simulateRemoteDataDelay<T>({@required Future<T> Function() func}) {
    return Future.delayed(Duration(milliseconds: 750), func);
  }
}