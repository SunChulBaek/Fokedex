import 'package:flutter/material.dart';

import '../common/pokemon_progress_indicator.dart';

class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: SizedBox(
      height: 24,
      width: 24,
      child: PokemonProgressIndicator(size: 30)
    ));
  }
}