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
  });
}
