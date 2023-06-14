import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_template/util/converter.dart';

class PokemonBg extends StatefulWidget {
  const PokemonBg({super.key});

  @override
  State<StatefulWidget> createState() => _PokemonBgState();
}

class _PokemonBgState extends State<PokemonBg> with TickerProviderStateMixin {
  static const timeUnit = 500;

  // 콘트롤러
  late final AnimationController _translateController;

  late final AnimationController _topController;

  late final AnimationController _bottomController;

  // 애니메이션
  late final Animation<double> _translate = Tween<double>(
    begin: 0,
    end: MediaQuery.of(context).size.width
  ).animate(_translateController);

  late final Animation<double> _top = Tween<double>(
    begin: -30,
    end: MediaQuery.of(context).size.height * 5
  ).animate(_topController);

  late final Animation<double> _bottom = Tween<double>(
    begin: MediaQuery.of(context).size.height * 5,
    end: -30
  ).animate(_bottomController);

  @override
  void initState() {
    _translateController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 7)
    )..repeat();

    _topController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: timeUnit * 5)
    );

    _bottomController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: timeUnit * 5)
    )..repeat();

    Future.delayed(const Duration(milliseconds: timeUnit), () {
      _topController.repeat();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PokemonBgPainter(
        translate: _translate,
        top: _top,
        bottom: _bottom,
      ),
      child: Container()
    );
  }
}

class _PokemonBgPainter extends CustomPainter {
  _PokemonBgPainter({
    required this.translate,
    required this.top,
    required this.bottom,
  }) : super(repaint: translate);

  final Animation translate;
  final Animation top;
  final Animation bottom;

  static const _tileSize = 40;
  static const _lineAlpha = 0.05;
  static const _lineAlphaAccent = 0.1;

  @override
  void paint(Canvas canvas, Size size) {
    // 그라데이션
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Paint()
        ..shader = ui.Gradient.linear(
          const Offset(0, 0),
          Offset(0, size.height),
          List.of([
            Colors.lightBlue.shade50, // 50
            Colors.lightBlue.shade200, // 200
            const Color(0xFF90caf9) // 200
          ]),
          List.of([0.0, 0.5, 1.0]),
        )
    );

    // 왼쪽 위 -> 오른쪽 아래
    for (int i = -size.height ~/ _tileSize; i <= size.width ~/ _tileSize; i++) {
      canvas.drawLine(
        Offset((i * _tileSize).toDouble() + translate.value, 0),
        Offset(
          size.height / tan(degToRad(60)) + i * _tileSize  + translate.value,
          size.height
        ),
        _linePaint(opacity: i % 4 == 0 ? _lineAlphaAccent : _lineAlpha)
      );
    }

    // 오른쪽 위 -> 왼쪽 아래
    for (int i = 0; i < (size.width + size.height) / _tileSize; i++) {
      canvas.drawLine(
        Offset((i * _tileSize).toDouble() + translate.value, 0),
        Offset(
          -size.height / tan(degToRad(60)) + i * _tileSize + translate.value,
          size.height
        ),
        _linePaint(opacity: i % 4 == 0 ? _lineAlphaAccent : _lineAlpha)
      );
    }

    // 직선
    final height = _tileSize * tan(degToRad(60));
    for (int i = 0; i <= size.height / height * 2; i++) {
      canvas.drawLine(
        Offset(-size.width, i * height / 2),
        Offset(size.width, i * height / 2),
        _linePaint(opacity: i % 4 == 0 ? _lineAlphaAccent : _lineAlpha)
      );
    }

    // 노이즈1
    canvas.drawRect(
      Rect.fromLTWH(0, top.value, size.width, 20),
      Paint()
        ..shader = ui.Gradient.linear(
          Offset(0, top.value),
          Offset(0, top.value + 20),
          List.of([
            Colors.white.withOpacity(0.5),
            Colors.white.withOpacity(0.1)
          ])
        )
    );

    // 노이즈2
    canvas.drawRect(
      Rect.fromLTWH(0, bottom.value, size.width, 20),
        Paint()
          ..shader = ui.Gradient.linear(
              Offset(0, bottom.value),
              Offset(0, bottom.value + 20),
              List.of([
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.1)
              ])
          )
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

  Paint _linePaint({
    Color color = Colors.white,
    double opacity = 1.0
  }) => Paint()
    ..color = color.withOpacity(opacity)
    ..strokeWidth = 2.0;
}