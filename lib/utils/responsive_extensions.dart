import 'package:flutter/material.dart';

extension MediaQueryExt on BuildContext {
  Size get mediaQuerySize => MediaQuery.of(this).size;

  double get screenWidth => mediaQuerySize.width;

  double get screenHeight => mediaQuerySize.height;

  bool get isMobileSize => mediaQuerySize.width <= 720;

  bool get isWebSize => mediaQuerySize.width > 720;
}
