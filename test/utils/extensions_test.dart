import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';

void main() {
  group('List extension', () {
    test('one value', () async {
      final list = <String>['SYD'];
      final listStr = list.toCommaString();

      expect(listStr, 'SYD');
    });

    test('more than one value', () async {
      final list = <String>['SYD', 'PAR'];
      final listStr = list.toCommaString();

      expect(listStr, 'SYD,PAR');
    });

    test('int values', () async {
      final list = <int>[5, 4, 3];
      final listStr = list.toCommaString();

      expect(listStr, '5,4,3');
    });
  });
}
