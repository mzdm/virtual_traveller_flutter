import 'package:flutter/material.dart';

// Source: https://github.com/lohanidamodar/flutter_custom_clippers/blob/master/lib/src/wave_clipper_1.dart
/// Clip widget in a wave shape. Use ClipPath widget for it.
class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final firstEndPoint = Offset(size.width * .5, size.height - 20);
    final firstControlPoint = Offset(size.width * .25, size.height - 45);
    final secondEndPoint = Offset(size.width, size.height - 50);
    final secondControlPoint = Offset(size.width * .75, size.height);

    final path = Path()
      ..lineTo(0.0, size.height)
      ..quadraticBezierTo(
        firstControlPoint.dx,
        firstControlPoint.dy,
        firstEndPoint.dx,
        firstEndPoint.dy,
      )
      ..quadraticBezierTo(
        secondControlPoint.dx,
        secondControlPoint.dy,
        secondEndPoint.dx,
        secondEndPoint.dy,
      )
      ..lineTo(size.width, 0.0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
