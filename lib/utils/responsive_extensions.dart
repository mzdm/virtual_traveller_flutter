import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  /// Returns the screen [Size] of the device.
  Size get mediaQuerySize => MediaQuery.of(this).size;

  /// Returns the screen width of the device.
  double get screenWidth => mediaQuerySize.width;

  /// Returns the screen height of the device.
  double get screenHeight => mediaQuerySize.height;

  /// Returns `true` if the horizontal screen size of the device
  /// belongs to mobile.
  bool get isMobileSize => mediaQuerySize.width <= 720;

  /// Returns `true` if the horizontal screen size of the device
  /// does not belong to mobile but to web/tablet.
  bool get isWebSize => mediaQuerySize.width > 720;
}
