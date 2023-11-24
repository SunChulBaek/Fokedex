import 'package:flutter/material.dart';

import '../../model/loadable.dart';
import '../../model/pokemon_detail.dart';

class _ProgressItem {
  _ProgressItem({
    required this.label,
    required this.items,
    required this.ids,
  });
  final String label;
  final List<Loadable?> items;
  final List<int> ids;
}

class PokemonDetailLoadingProgress extends StatelessWidget {
  const PokemonDetailLoadingProgress({
    required this.pokemon,
    super.key
  });

  final PokemonDetail? pokemon;

  @override
  Widget build(BuildContext context) => Container(
    height: 10,
    color: Colors.grey,
    child: Row(
      children: [
        ...[
          _ProgressItem(
            label: "Form",
            items: List<Loadable?>.of([pokemon?.form]),
            ids: List.of([pokemon?.formId ?? 0])
          ),
          _ProgressItem(
            label: "Type",
            items: pokemon?.types ?? List.of([]),
            ids: pokemon?.totalTypeIds ?? List.of([0])
          ),
          _ProgressItem(
            label: "Species",
            items: List<Loadable?>.of([pokemon?.species]),
            ids: List.of([pokemon?.speciesId ?? 0])
          ),
          _ProgressItem(
            label: "Evolution",
            items: List<Loadable?>.of([pokemon?.evolutionChain]),
            ids: List.of([pokemon?.evolutionChainId ?? 0])
          ),
        ].map((e) =>
          Expanded(
            flex: e.ids.length,
            child: _LoadingProgress(
              label: e.label,
              items: e.items,
              totalIds: e.ids,
            )
          )
        )
      ]
    ));
}

class _LoadingProgress extends StatelessWidget {
  static const colorFromInternet = Color(0xFF4caf50);
  static const colorFromDB = Color(0xFF3f51b5);

  const _LoadingProgress({
    required this.label,
    required this.items,
    required this.totalIds,
  });

  final String label;
  final List<Loadable?> items;
  final List<int> totalIds;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      ...totalIds.map((id) {
          final Loadable? item = items.where((e) => e != null && e.id == id).firstOrNull;
          return Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: item?.fromDB == true ? colorFromDB : (item?.fromDB == false ? colorFromInternet : Colors.transparent),
                border: Border.all(width: 1)
              ),
              child: Text(label, style: const TextStyle(fontSize: 7))
            )
          );
        }
      )
    ]
  );
}