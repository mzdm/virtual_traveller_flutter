import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:virtual_traveller_flutter/main.dart';

void main() {
  test('a passing test', () {
    expect(true, true);
  });

  testWidgets('widgets', (tester) async {
    await tester.pumpWidget(
      MyApp(),
    );
    expect(find.text('Flutter Demo'), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
  });
}
