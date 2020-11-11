import 'package:flutter/material.dart';

class ToolbarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final controlPoint = Offset(size.width * 0.5, size.height * 0.6);
    final endPoint = Offset(size.width, 0.0);

    final path = Path()
      ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
