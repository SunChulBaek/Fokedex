import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../util/converter.dart';
import '../model/ui_pokemon_detail.dart';

class PokemonEvolutionChain extends StatelessWidget {
  const PokemonEvolutionChain({required this.pokemon, super.key});

  final UiPokemonDetail pokemon;

  @override
  Widget build(BuildContext context) {
    const size = 50;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이미지
        DrawPokemons(columnIndex: 0, pokemon: pokemon, size: size),
        // 가지치기
        Expanded(
          flex:1,
          child: CustomPaint(
            painter: DrawEvolutionLines(columnIndex: 1, pokemon: pokemon, size: size),
            child: Container(height: size.toDouble())
        )),
        // 이미지
        DrawPokemons(columnIndex: 1, pokemon: pokemon, size: size),
        // 가지치기
        if (maxEvolutionChainLength(pokemon) == 3)
          Expanded(
            flex: 1,
            child: CustomPaint(
              painter: DrawEvolutionLines(columnIndex: 2, pokemon: pokemon, size: size),
              child: Container(height: size.toDouble())
          )),
        // 이미지
        if (maxEvolutionChainLength(pokemon) == 3)
          DrawPokemons(columnIndex: 2, pokemon: pokemon, size: size),
      ],
    );
  }
}

class DrawEvolutionLines extends CustomPainter {
  const DrawEvolutionLines({
    required this.columnIndex,
    required this.pokemon,
    required this.size,
  });

  final int columnIndex;
  final UiPokemonDetail pokemon;
  final int size;

  @override
  void paint(Canvas canvas, Size size) {
    columnPokemonIdTriggers(pokemon, columnIndex, (index, id) {
      final prevColumnItems = columnPokemonIdTriggers(pokemon, columnIndex - 1, (p0, p1) { });
      final prevNodeIndexx = prevNodeIndex(id, pokemon, prevColumnItems, columnIndex);
      canvas.drawLine(
        Offset(0, (prevNodeIndexx + 0.5) * this.size),
        Offset(size.width, (index + 0.5) * this.size),
        Paint()
          ..color = Colors.white
          ..strokeWidth = 2
      );
    });
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DrawPokemons extends StatelessWidget {
  const DrawPokemons({
    required this.columnIndex,
    required this.pokemon,
    required this.size,
    super.key
  });

  final int columnIndex;
  final UiPokemonDetail pokemon;
  final int size;

  @override
  Widget build(BuildContext context) {
    final ids = columnPokemonIdTriggers(pokemon, columnIndex, (a, b){});
    return Column(
      children: [
        ...ids.map((id) =>
          Container(
            width: size.toDouble(),
            height: size.toDouble(),
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
            child: CachedNetworkImage(
              imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
              fit: BoxFit.fitWidth,
            )
          )
        )
      ],
    );
  }
}

List<int> columnPokemonIdTriggers(
  UiPokemonDetail pokemon,
  int columnIndex,
  void Function(int, int) action,
) {
  var list = pokemon.chains.where((chain) =>
    chain.length > columnIndex
  ).map((chain) =>
    chain[columnIndex]
  ).fold(List<int>.of([]), (acc, element) {
    if (!acc.contains(element.pId)) {
      acc.add(element.pId);
    }
    return acc;
  });

  var index = 0;
  for (var e in list) {
    action(index++, e);
  }
  return list;
}

int prevNodeIndex(
  int pId,
  UiPokemonDetail pokemon,
  List<int> prevColumnItems,
  int columnIndex,
) {
  int prevNodeIndex = pokemon.chains.firstWhere((chain) =>
    chain.map((e) => e.pId).contains(pId)
  ).map((e) => e.pId).toList().indexOf(pId) - 1;
  int prevNodeId = pokemon.chains.firstWhere((chain) =>
    chain.map((e) => e.pId).contains(pId)
  ).map((e) => e.pId).toList().elementAt(prevNodeIndex);
  return prevColumnItems.indexWhere((id) => id == prevNodeId);
}