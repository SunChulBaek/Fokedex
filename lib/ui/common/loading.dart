import 'package:flutter/material.dart';
import 'package:flutter_template/ui/common/pokemon_progress_indicator.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: PokemonProgressIndicator(size: 30)
    );
  }
}