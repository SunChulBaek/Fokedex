import 'dart:math';

import 'package:flutter/material.dart';

class MonsterBall extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height);
    double borderWidth = radius * 0.1;
    double divider = radius * 0.2;

    canvas.clipPath(Path()
      ..addOval(Rect.fromLTWH(
        size.width / 2 - radius,
        size.height / 2 - radius,
        radius * 2,
        radius * 2
      )));
    canvas.drawRect(
      Rect.fromLTWH(
        size.width / 2 - radius,
        size.height / 2 - radius,
        radius * 2,
        radius
      ),
      Paint()
        ..color = Colors.red
    );
    canvas.drawRect(
      Rect.fromLTWH(
        size.width / 2 - radius,
        size.height / 2,
        radius * 2,
        radius
      ),
      Paint()
        ..color = Colors.white
    );
    // divider
    canvas.drawRect(
      Rect.fromLTWH(
        size.width / 2 - radius,
        size.height / 2 - divider / 2,
        radius * 2,
        divider),
      Paint()
        ..color = Colors.black
    );
    // border
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius,
      Paint()
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.stroke
    );
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius * 0.4,
      Paint()
        ..color = Colors.black
    );
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius * 0.2,
      Paint()
        ..color = Colors.white
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}