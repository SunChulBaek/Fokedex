import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/data/model/pokemon.dart';
import 'package:flutter_template/ui/detail/photo.dart';

class PokemonListItem extends StatelessWidget {
  const PokemonListItem({super.key, required this.pokemon, required this.onClick});

  final Pokemon pokemon;
  final void Function(BuildContext context, Object param) onClick;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: InkWell(
        child: Row(
          children: [
            CachedNetworkImage(
              width: 80,
              height: 80,
              imageUrl: pokemon.url,
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Text(pokemon.name, maxLines: 2, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 8),
                  ]
                )
              )
            )
          ],
        ),
        onTap: () => onClick.call(
            context,
            PokemonParam(
              title: pokemon.name,
              url: pokemon.url,
            )
          )
        )
      );
  }
}