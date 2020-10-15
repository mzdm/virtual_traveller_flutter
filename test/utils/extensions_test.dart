import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/data/models/poi.dart';
import 'package:virtual_traveller_flutter/utils/extensions.dart';

void main() {
  group('List extension', () {
    test('one value', () async {
      final list = <String>['SYD'];
      final strList = list.toCommaString();

      expect(strList, 'SYD');
    });

    test('more than one value', () async {
      final list = <String>['SYD', 'PAR'];
      final strList = list.toCommaString();

      expect(strList, 'SYD,PAR');
    });

    test('int values', () async {
      final list = <int>[5, 4, 3];
      final strList = list.toCommaString();

      expect(strList, '5,4,3');
    });

    test('CategoryPOI enum values', () async {
      final categories = <CategoryPOI>[
        CategoryPOI.NIGHTLIFE,
        CategoryPOI.RESTAURANT,
      ];
      final strList = categories.map((category) => describeEnum(category)).toList();

      expect(strList.toCommaString(), 'NIGHTLIFE,RESTAURANT');
    });
  });
}
