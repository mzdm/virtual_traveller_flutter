import 'package:flutter/foundation.dart';

class AmadeusMockedDataProvider {
  Future<T> simulateRemoteDataDelay<T>({@required Future<T> Function() func}) {
    return Future.delayed(Duration(milliseconds: 750), func);
  }
}