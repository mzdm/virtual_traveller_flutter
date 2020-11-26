import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';

void main() {
  group('List extensions', () {
    group('toCommaString function', () {
      test('String - 1 value', () {
        final list = <String>['SYD'];
        final strList = list.toCommaString();

        expect(strList, 'SYD');
      });

      test('String - more than a 1 value', () {
        final list = <String>['SYD', 'PAR'];
        final strList = list.toCommaString();

        expect(strList, 'SYD,PAR');
      });

      test('int values', () {
        final list = <int>[5, 4, 3];
        final strList = list.toCommaString();

        expect(strList, '5,4,3');
      });

      test('CategoryPOI enum values', () {
        final categories = <CategoryPOI>[
          CategoryPOI.NIGHTLIFE,
          CategoryPOI.RESTAURANT,
        ];
        final strList =
            categories.map((category) => describeEnum(category)).toList();

        expect(strList.toCommaString(), 'NIGHTLIFE,RESTAURANT');
      });
    });
  });

  group('String extensions', () {
    group('toPascalCase function', () {
      test('uppercase only - 1 word input', () {
        final inputStr = 'PARIS';

        expect(inputStr.toPascalCase(), 'Paris');
      });

      test('mixed letter cases - 1 word input', () {
        final inputStr = 'pArIs';

        expect(inputStr.toPascalCase(), 'Paris');
      });

      test('1 word with whitespace input', () {
        final inputStr = 'PARIS ';

        expect(inputStr.toPascalCase(), 'Paris');
      });

      test('uppercase only - 2 words input', () {
        final inputStr = 'PARIS CAFÉ';

        expect(inputStr.toPascalCase(), 'Paris Café');
      });

      test('mixed letter cases - 2 words input', () {
        final inputStr = 'PARIs Café';

        expect(inputStr.toPascalCase(), 'Paris Café');
      });

      test('uppercase only - many words input', () {
        final inputStr = 'PARIS CAFÉ AND RESTAURANT HOTEL LUXURY 250';

        expect(
          inputStr.toPascalCase(),
          'Paris Café And Restaurant Hotel Luxury 250',
        );
      });

      test('mixed letter cases - many words input', () {
        final inputStr = 'Paris café and RESTAURANT hotel luxury 250';

        expect(
          inputStr.toPascalCase(),
          'Paris Café And Restaurant Hotel Luxury 250',
        );
      });

      test('empty input', () {
        final inputStr = '';

        expect(inputStr.toPascalCase(), '');
      });

      test('1 lower case letter input', () {
        final inputStr = 'd';

        expect(inputStr.toPascalCase(), 'D');
      });

      test('1 upper case letter input', () {
        final inputStr = 'D';

        expect(inputStr.toPascalCase(), 'D');
      });

      test('1 number input', () {
        final inputStr = 2.toString();

        expect(inputStr.toPascalCase(), '2');
      });
    });
  });
}
