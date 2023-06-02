import 'package:flutter/material.dart';
import 'package:flutter_template/ui/detail/pokemon_thumb.dart';

import '../../util/converter.dart';
import '../model/ui_pokemon_detail.dart';

class PokemonEvolutionChain extends StatelessWidget {
  const PokemonEvolutionChain({
    required this.pokemon,
    required this.size,
    required this.normalColor,
    required this.accentColor,
    required this.onClick,
    super.key
  });

  final UiPokemonDetail pokemon;
  final int size;
  final Color normalColor;
  final Color accentColor;
  final void Function(BuildContext context, Object param) onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 이미지
        DrawPokemons(columnIndex: 0, pokemon: pokemon, size: size, normalColor: normalColor, accentColor: accentColor, onClick: onClick),
        // 가지치기
        Expanded(
          flex:1,
          child: CustomPaint(
            painter: DrawEvolutionLines(columnIndex: 1, pokemon: pokemon, size: size, normalColor: normalColor, accentColor: accentColor),
            child: Container(height: size.toDouble())
        )),
        // 이미지
        DrawPokemons(columnIndex: 1, pokemon: pokemon, size: size, normalColor: normalColor, accentColor: accentColor, onClick: onClick),
        // 가지치기
        if (maxEvolutionChainLength(pokemon) == 3)
          Expanded(
            flex: 1,
            child: CustomPaint(
              painter: DrawEvolutionLines(columnIndex: 2, pokemon: pokemon, size: size, normalColor: normalColor, accentColor: accentColor),
              child: Container(height: size.toDouble())
          )),
        // 이미지
        if (maxEvolutionChainLength(pokemon) == 3)
          DrawPokemons(columnIndex: 2, pokemon: pokemon, size: size, normalColor: normalColor, accentColor: accentColor, onClick: onClick),
      ],
    );
  }
}

class DrawEvolutionLines extends CustomPainter {
  const DrawEvolutionLines({
    required this.columnIndex,
    required this.pokemon,
    required this.size,
    required this.normalColor,
    required this.accentColor,
  });

  final int columnIndex;
  final UiPokemonDetail pokemon;
  final int size;
  final Color normalColor;
  final Color accentColor;

  @override
  void paint(Canvas canvas, Size size) {
    columnPokemonIdTriggers(pokemon, columnIndex, (index, id) {
      final prevColumnItems = columnPokemonIdTriggers(pokemon, columnIndex - 1, (p0, p1) { });
      final prevNodeIndexx = prevNodeIndex(id, pokemon, prevColumnItems, columnIndex);
      canvas.drawLine(
        Offset(0, (prevNodeIndexx + 0.5) * this.size),
        Offset(size.width, (index + 0.5) * this.size),
        Paint()
          ..color = isActivePokemon(id, pokemon) ? Colors.lime : Colors.white
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
    required this.normalColor,
    required this.accentColor,
    required this.onClick,
    super.key
  });

  final int columnIndex;
  final UiPokemonDetail pokemon;
  final int size;
  final Color normalColor;
  final Color accentColor;
  final void Function(BuildContext context, Object param) onClick;

  @override
  Widget build(BuildContext context) {
    final ids = columnPokemonIdTriggers(pokemon, columnIndex, (a, b){});
    return Column(
      children: [
        ...ids.map((id) =>
            PokemonThumb(
              id: id,
              pokemon: pokemon,
              size: size.toDouble(),
              normalColor: normalColor,
              accentColor: accentColor,
              isActive: () => isActivePokemon(id, pokemon),
              onClick: onClick
            )
        )
      ],
    );
  }
}

bool isActivePokemon(int id, UiPokemonDetail pokemon) =>
  activePokemonIds(pokemon).contains(id);

List<int> activePokemonIds(UiPokemonDetail pokemon) {
  final chain = pokemon.chains.firstWhere((chain) =>
    chain.map((it) => it.pId).contains(pokemon.id)
  ).map((it) => it.pId).toList();

  return chain.fold(List<int>.empty(growable: true), (acc, id) {
    if (chain.indexOf(id) <= chain.indexOf(pokemon.id)) {
      acc.add(id);
    }
    return acc;
  });
}

List<int> columnPokemonIdTriggers(
  UiPokemonDetail pokemon,
  int columnIndex,
  void Function(int, int) action,
) {
  final list = pokemon.chains.where((chain) =>
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
  final prevNodeIndex = pokemon.chains.firstWhere((chain) =>
    chain.map((e) => e.pId).contains(pId)
  ).map((e) => e.pId).toList().indexOf(pId) - 1;

  final prevNodeId = pokemon.chains.firstWhere((chain) =>
    chain.map((e) => e.pId).contains(pId)
  ).map((e) => e.pId).toList().elementAt(prevNodeIndex);

  return prevColumnItems.indexWhere((id) => id == prevNodeId);
}