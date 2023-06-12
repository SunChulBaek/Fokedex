import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../common/pokemon_progress_indicator.dart';
import '../detail/pokemon.dart';
import '../model/ui_pokemon.dart';

class PokemonGridItem extends StatelessWidget {
  const PokemonGridItem({
    super.key,
    required this.pokemon,
    required this.onClick
  });

  final UiPokemon pokemon;
  final void Function(BuildContext context, Object param) onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: List.of([
              const Color(0xFFb3e5fc), // 100
              const Color(0xFFe1f5fe) // 50
            ])
          )
        ),
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                Expanded(
                  child: Hero(
                    tag: pokemon.id,
                    child: CachedNetworkImage(
                      imageUrl: pokemon.imageUrl,
                      fit: BoxFit.fitHeight,
                      placeholder: (context, url) => const Center(child: PokemonProgressIndicator(size: 30)),
                      errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
                    )
                  )
                ),
                const SizedBox(height: 10),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    color: const Color(0xFFb3e5fc),// 100
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: Text(
                        pokemon.id.toString(),
                        style: const TextStyle(color: Colors.white, fontSize: 8),
                      )
                    )
                  )
                )
              )
            ),
          ]
        )
      ),
      onTap: () => onClick.call(
        context,
        PokemonParam(
          id: pokemon.id,
          title: pokemon.name,
          url: pokemon.imageUrl,
          colorStart: 0xFFe91e63,
          colorEnd: 0xFF03a9f4
        )
      )
    );
  }
}