import 'package:flutter/material.dart';

import 'monster_ball.dart';

class PokemonProgressIndicator extends StatefulWidget {
  const PokemonProgressIndicator({super.key, required this.size});

  final double size;

  @override
  State<StatefulWidget> createState() => _PokemonProgressIndicatorState();
}

class _PokemonProgressIndicatorState extends State<PokemonProgressIndicator> with TickerProviderStateMixin {

  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 300),
    vsync: this,
  )..repeat(reverse: false);

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.linear
  );

  @override
  Widget build(BuildContext context) => RotationTransition(
    turns: _animation,
    child: CustomPaint(
      painter: MonsterBall(),
      child: SizedBox(width: widget.size, height: widget.size)
    )
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}