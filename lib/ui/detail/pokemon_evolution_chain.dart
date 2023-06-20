import 'package:flutter/material.dart';
import 'package:flutter_template/ui/detail/pokemon_thumb.dart';
import 'package:flutter_template/ui/model/ui_chain_entry.dart';

import '../../util/converter.dart';

class PokemonEvolutionChain extends StatelessWidget {
  const PokemonEvolutionChain({
    required this.pId,
    required this.chains,
    required this.size,
    required this.normalColor,
    required this.accentColor,
    required this.onClick,
    super.key
  });

  final int pId;
  final List<List<UiChainEntry>> chains;
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
        DrawPokemons(columnIndex: 0, pId: pId, chains: chains, size: size, normalColor: normalColor, accentColor: accentColor, onClick: onClick),
        // 가지치기
        Expanded(
          flex:1,
          child: CustomPaint(
            painter: DrawEvolutionLines(columnIndex: 1, chains: chains, pId: pId, size: size, normalColor: normalColor, accentColor: accentColor),
            child: Container(height: size.toDouble())
        )),
        // 이미지
        DrawPokemons(columnIndex: 1, pId: pId, chains: chains, size: size, normalColor: normalColor, accentColor: accentColor, onClick: onClick),
        // 가지치기
        if (maxEvolutionChainLength(chains) == 3)
          Expanded(
            flex: 1,
            child: CustomPaint(
              painter: DrawEvolutionLines(columnIndex: 2, chains: chains, pId: pId, size: size, normalColor: normalColor, accentColor: accentColor),
              child: Container(height: size.toDouble())
          )),
        // 이미지
        if (maxEvolutionChainLength(chains) == 3)
          DrawPokemons(columnIndex: 2, pId: pId, chains: chains, size: size, normalColor: normalColor, accentColor: accentColor, onClick: onClick),
      ],
    );
  }
}

class DrawEvolutionLines extends CustomPainter {
  const DrawEvolutionLines({
    required this.columnIndex,
    required this.chains,
    required this.pId,
    required this.size,
    required this.normalColor,
    required this.accentColor,
  });

  final int columnIndex;
  final List<List<UiChainEntry>> chains;
  final int pId;
  final int size;
  final Color normalColor;
  final Color accentColor;

  @override
  void paint(Canvas canvas, Size size) {
    columnPokemonIdTriggers(chains, columnIndex, (index, id) {
      final prevColumnItems = columnPokemonIdTriggers(chains, columnIndex - 1, (p0, p1) { });
      final prevNodeIndexx = prevNodeIndex(id, chains, prevColumnItems, columnIndex);
      canvas.drawLine(
        Offset(0, (prevNodeIndexx + 0.5) * this.size),
        Offset(size.width, (index + 0.5) * this.size),
        Paint()
          ..color = isActivePokemon(id, chains, pId) ? accentColor : normalColor
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
    required this.pId,
    required this.chains,
    required this.size,
    required this.normalColor,
    required this.accentColor,
    required this.onClick,
    super.key
  });

  final int columnIndex;
  final List<List<UiChainEntry>> chains;
  final int pId;
  final int size;
  final Color normalColor;
  final Color accentColor;
  final void Function(BuildContext context, Object param) onClick;

  @override
  Widget build(BuildContext context) {
    final ids = columnPokemonIdTriggers(chains, columnIndex, (a, b){});
    return Column(
      children: [
        ...ids.map((id) =>
            PokemonThumb(
              id: id,
              pId: pId,
              size: size.toDouble(),
              normalColor: normalColor,
              accentColor: accentColor,
              isActive: () => isActivePokemon(id, chains, pId),
              onClick: onClick
            )
        )
      ],
    );
  }
}

bool isActivePokemon(int id, List<List<UiChainEntry>> chains, int pId) =>
  activePokemonIds(chains, pId).contains(id);

List<int> activePokemonIds(List<List<UiChainEntry>> chains, int pId) {
  final chain = chains.firstWhere((chain) =>
    chain.map((it) => it.pId).contains(pId),
    orElse: () => List<UiChainEntry>.empty()
  ).map((it) => it.pId).toList();

  return chain.fold(List<int>.empty(growable: true), (acc, id) {
    if (chain.indexOf(id) <= chain.indexOf(pId)) {
      acc.add(id);
    }
    return acc;
  });
}

List<int> columnPokemonIdTriggers(
  List<List<UiChainEntry>> chains,
  int columnIndex,
  void Function(int, int) action,
) {
  final list = chains.where((chain) =>
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
  List<List<UiChainEntry>> chains,
  List<int> prevColumnItems,
  int columnIndex,
) {
  final prevNodeIndex = chains.firstWhere((chain) =>
    chain.map((e) => e.pId).contains(pId)
  ).map((e) => e.pId).toList().indexOf(pId) - 1;

  final prevNodeId = chains.firstWhere((chain) =>
    chain.map((e) => e.pId).contains(pId)
  ).map((e) => e.pId).toList().elementAt(prevNodeIndex);

  return prevColumnItems.indexWhere((id) => id == prevNodeId);
}