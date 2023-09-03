import 'package:flutter/material.dart';

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {

    Path path = Path()
      ..lineTo(0, size.height /1.15)
      ..cubicTo(size.width / 3, 3 * (size.height / 2.5), 3 * (size.width / 4),
          size.height / 1.5, size.width, size.height )
      // ..quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
