import 'package:flutter_driver/driver_extension.dart';
import 'package:virtual_traveller_flutter/main.dart' as app;

// run all with:
// flutter drive --target=test_driver/app.dart
//
// or on real device with:
// flutter drive --profile --target=test_driver/app.dart
void main() {
  enableFlutterDriverExtension();
  app.main();
}
