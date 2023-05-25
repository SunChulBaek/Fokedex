
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/detail/pokemon.dart';

class HomeShortcuts extends StatelessWidget {
  HomeShortcuts({super.key, required this.shortcuts, required this.onClickItem});

  final List<int> shortcuts;
  final void Function(BuildContext context, Object param) onClickItem;

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.grey,
    height: 50,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      itemCount: shortcuts.length,
      itemBuilder: (context, index) {
        int id = shortcuts[index];
        return Row(children: [
          const SizedBox(width: 8),
          InkWell(
            child: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: CachedNetworkImage(
                imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
                fit: BoxFit.fitWidth,
              )
            ),
            onTap: () {
              onClickItem(
                context,
                PokemonParam(
                  id: id,
                  title: "name", // TODO : 수정
                  url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
                  colorStart: 0xFFe91e63,
                  colorEnd: 0xFF03a9f4
                )
              );
            },
          )
        ]);
      })
  );
}