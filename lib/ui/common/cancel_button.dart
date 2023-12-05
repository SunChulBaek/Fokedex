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

class _CancelButtonState extends State<CancelButton> with TickerProviderStateMixin {
  static const timeUnit = 300;
  static const double centerRadius = 20;

  bool _startRipple = false;

  // 콘트롤러
  late final AnimationController _innerRippleController;
  late final AnimationController _outerRippleController;
  late final AnimationController _opacityController;

  // 애니메이션
  late final Animation<double> _innerRipple = Tween<double>(
    begin: centerRadius,
    end: centerRadius * 3
  ).animate(_innerRippleController);

  late final Animation<double> _outerRipple = Tween<double>(
    begin: centerRadius * 3,
    end: centerRadius * 10
  ).animate(_outerRippleController);

  late final Animation<double> _opacityRipple = Tween<double>(
    begin: 0.8,
    end: 0
  ).animate(_opacityController);

  @override
  void initState() {
    _innerRippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: timeUnit)
    );
    _outerRippleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: timeUnit)
    );
    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: timeUnit)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _startRipple = true;
          _innerRippleController.forward();
          _outerRippleController.forward();
          _opacityController.forward();
        });
        Future.delayed(const Duration(milliseconds: timeUnit)).then((value) {
          widget.onClick();
        });
      },
      child: CustomPaint(
        painter: _CancelButton(
          color: Colors.teal,
          borderWidth: widget.borderWidth,
          border2Width: widget.border2Width,
          startRipple: _startRipple,
          innerRippleRadius: _innerRipple,
          outerRippleRadius: _outerRipple,
          opacity: _opacityRipple,
        ),
        child: Container(),
      ),
    );
  }

  @override
  void dispose() {
    _innerRippleController.dispose();
    _outerRippleController.dispose();
    _opacityController.dispose();
    super.dispose();
  }
}

class _CancelButton extends CustomPainter {
  const _CancelButton({
    required this.color,
    required this.borderWidth,
    required this.border2Width,
    required this.startRipple,
    required this.innerRippleRadius,
    required this.outerRippleRadius,
    required this.opacity,
  }) : super(repaint: innerRippleRadius);

  final Color color;
  final double borderWidth;
  final double border2Width;
  final bool startRipple;
  final Animation innerRippleRadius;
  final Animation outerRippleRadius;
  final Animation opacity;

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

    // ripple
    if (startRipple) {
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2),
          innerRippleRadius.value,
          Paint()
            ..color = Colors.white.withOpacity(opacity.value)
      );
      canvas.drawCircle(
          Offset(size.width / 2, size.height / 2),
          outerRippleRadius.value,
          Paint()
            ..style = PaintingStyle.stroke
            ..color = Colors.white.withOpacity(opacity.value)
            ..strokeWidth = 10
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}