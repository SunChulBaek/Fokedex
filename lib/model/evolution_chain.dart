import 'dart:collection';

import 'loadable.dart';
import '../database/model/evolution_chain_entity.dart';
import '../ui/model/ui_chain_entry.dart';

class EvolutionChain extends Loadable {
  EvolutionChain({
    required int id,
    required this.chains,
    bool fromDB = false
  }) : super(id, fromDB);

  List<List<UiChainEntry>> chains;

  factory EvolutionChain.fromEntity(
    int id,
    List<EvolutionChainEntity> entities,
    {
      bool fromDB = false
    }
  ) => EvolutionChain(
    id: id,
    chains: entities.where((e) => e.isLeaf).map((leaf) {
      final list = List<UiChainEntry>.of([]);
      EvolutionChainEntity? entry = leaf;
      while (entry != null) {
        list.add(UiChainEntry(
          pId: entry.pId,
          prevId: entry.prevId ?? 0,
          trigger: entry.trigger,
          isLeaf: entry.isLeaf
        ));
        entry = entities.where((e) => e.pId == entry?.prevId).firstOrNull;
      }
      return list.reversed.toList();
    }).toList(),
    fromDB: fromDB
  );
}