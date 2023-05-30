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
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: InkWell(
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
                Text(pokemon.name, maxLines: 2, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 10),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 8, top: 8),
                child: Text(pokemon.id.toString())
              )
            ),
          ]
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
      )
    );
  }
}