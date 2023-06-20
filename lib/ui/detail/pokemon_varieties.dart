import 'package:flutter/material.dart';

import 'pokemon_thumb.dart';

class PokemonVarieties extends StatelessWidget {
  const PokemonVarieties({
    required this.pId,
    required this.varietyIds,
    required this.onClick,
    super.key
  });

  final int pId;
  final List<int> varietyIds;
  final void Function(BuildContext context, Object param) onClick;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      for (int i = 0; i < (((varietyIds.length - 1) / 3)) + 1; i++)
        Row(
          children: [
            for (int j = 0; j < 3; j++)
            ...[
              if ((i * 3) + j <= varietyIds.length - 1)
                PokemonThumb(
                  id: varietyIds[(i * 3) + j],
                  pId: pId,
                  size: 60,
                  normalColor: Colors.white,
                  accentColor: const Color(0xFF03a9f4),
                  isActive: () => pId == varietyIds[(i * 3) + j],
                  onClick: onClick
                ),
              if ((i * 3) + j > varietyIds.length - 1)
                const SizedBox(width: 60, height: 60),
              if (j < 2)
                Expanded(child: Container()),
            ]
          ]
        )
    ],
  );
}