import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/detail/pokemon_thumb.dart';

import '../model/ui_pokemon_detail.dart';

class PokemonVarieties extends StatelessWidget {
  const PokemonVarieties({
    required this.pokemon,
    required this.onClick,
    super.key
  });

  final UiPokemonDetail pokemon;
  final void Function(BuildContext context, Object param) onClick;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (int i = 0; i < (((pokemon.varietyIds.length - 1) / 3)) + 1; i++)
        Row(
          children: [
            for (int j = 0; j < 3; j++)
            ...[
              if ((i * 3) + j <= pokemon.varietyIds.length - 1)
                PokemonThumb(
                  id: pokemon.varietyIds[(i * 3) + j],
                  pokemon: pokemon,
                  size: 60,
                  normalColor: Colors.white,
                  accentColor: const Color(0xFF03a9f4),
                  isActive: () => pokemon.id == pokemon.varietyIds[(i * 3) + j],
                  onClick: onClick
                ),
              if ((i * 3) + j > pokemon.varietyIds.length - 1)
                const SizedBox(width: 60, height: 60),
              if (j < 2)
                Expanded(child: Container()),
            ]
          ]
        )
    ],
  );
}