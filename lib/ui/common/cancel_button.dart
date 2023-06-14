import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_template/util/converter.dart';

class CancelButton extends StatefulWidget {
  const CancelButton({
    this.borderWidth = 5,
    this.border2Width = 2,
    required this.onClick,
    super.key
  });

  final double borderWidth;
  final double border2Width;
  final void Function() onClick;

  @override
  State<StatefulWidget> createState() => _CancelButtonState();
}

class _CancelButtonState extends State<CancelButton> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick,
      child: CustomPaint(
        painter: _CancelButton(
          color: Colors.teal,
          borderWidth: widget.borderWidth,
          border2Width: widget.border2Width,
        ),
        child: Container(),
      ),
    );
  }
}

class _CancelButton extends CustomPainter {
  const _CancelButton({
    required this.color,
    required this.borderWidth,
    required this.border2Width
  });

  final Color color;
  final double borderWidth;
  final double border2Width;

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height) /2;
    
    // border
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius - borderWidth / 2,
      Paint()
        ..strokeWidth = borderWidth
        ..style = PaintingStyle.stroke
        ..color = Colors.white.withOpacity(0.4)
    );

    // 컬러 border
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      radius - borderWidth - border2Width / 2,
      Paint()
        ..strokeWidth = border2Width
        ..style = PaintingStyle.stroke
        ..color = color
    );

    // 센터
    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2),
        radius - borderWidth - border2Width,
        Paint()
          ..strokeWidth = borderWidth
          ..color = Colors.white.withOpacity(0.8)
    );

    // X
    final offset = (radius - borderWidth - border2Width) / 2 * cosDeg(45);
    canvas.drawLine(
      Offset(
          size.width / 2 - offset,
          size.height / 2 - offset
      ),
      Offset(
          size.width / 2 + offset,
          size.height / 2 + offset
      ),
      Paint()
        ..strokeWidth = border2Width
        ..color = color
    );
    canvas.drawLine(
        Offset(
            size.width / 2 + offset,
            size.height / 2 - offset
        ),
        Offset(
            size.width / 2 - offset,
            size.height / 2 + offset
        ),
        Paint()
          ..strokeWidth = border2Width
          ..color = color
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}