import 'dart:math';

import 'package:flutter/material.dart';

class DialogClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var height = size.height;
    var width = size.width;

    Path path = Path()
      ..moveTo(width * 0.12, height)
      ..lineTo(width * 0.12, height * 0.96)
      ..conicTo(width * 0.12, height * 0.94, width * 0.15, height * 0.94, 1)
      ..lineTo(width * 0.37, height * 0.94)
      ..conicTo(width * 0.4, height * 0.94, width * 0.4, height * 0.96, 1)
      ..lineTo(width * 0.4, height)
      ..lineTo(width * 0.6, height)
      ..lineTo(width * 0.6, height * 0.96)
      ..conicTo(width * 0.6, height * 0.94, width * 0.63, height * 0.94, 1)
      ..lineTo(width * 0.85, height * 0.94)
      ..conicTo(width * 0.88, height * 0.94, width * 0.88, height * 0.96, 1)
      ..lineTo(width * 0.88, height)
      ..lineTo(width, height)
      ..lineTo(width, height * 0.2)
      ..conicTo(width, height * 0.13, width * 0.9, height * 0.13, 1)
      ..lineTo(width * 0.69, height * 0.13)
      ..cubicTo(width * 0.668, height * 0.355, width * 0.32, height * 0.355,
          width * 0.30, height * 0.13)
      ..lineTo(width * 0.1, height * 0.13)
      ..conicTo(0, height * 0.13, 0, height * 0.2, 1)
      ..lineTo(0, height)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }

  double degToRad(double deg) {
    return deg * pi / 180;
  }
}

class DialogButton extends StatelessWidget {
  const DialogButton({
    required this.width,
    required this.height,
    required this.child,
    required this.color,
    super.key,
  });

  final double width;
  final double height;
  final Widget child;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(5), color: color),
      child: child,
    );
  }
}
