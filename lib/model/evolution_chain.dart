import 'dart:collection';

import 'loadable.dart';
import '../data/model/network_chain_link.dart';
import '../data/model/network_evolution_chain.dart';
import '../ui/model/ui_chain_entry.dart';
import '../util/converter.dart';

class EvolutionChain extends Loadable {
  EvolutionChain({
    required int id,
    required this.chains,
    bool fromDB = false
  }) : super(id, fromDB);

  List<List<UiChainEntry>> chains;

  factory EvolutionChain.fromNetworkModel(
    NetworkEvolutionChain chain,
    {
      bool fromDB = false
    }
  ) => EvolutionChain(
    id: chain.id,
    chains: getChains(chain),
    fromDB: fromDB
  );

  static List<List<UiChainEntry>> getChains(NetworkEvolutionChain evolutionChain) {
    final map = HashMap<int, UiChainEntry>();
    final queue = Queue<NetworkChainLink>()..add(evolutionChain.chain);
    while (queue.isNotEmpty) {
      final node = queue.removeFirst();
      final nodeId = getIdFromUrl(node.species.url);
      if (!map.containsKey(nodeId)) {
        map[nodeId] = UiChainEntry(
            pId: nodeId,
            prevId: 0,
            trigger: node.evolutionDetails.firstOrNull?.item?.name ?? "0",
            isLeaf: false
        );
      }
      if (node.evolvesTo.isEmpty) {
        final nodex = map[getIdFromUrl(node.species.url)];
        if (nodex != null) {
          map[nodeId] = nodex.copyWith(
              isLeaf: true
          );
        }
      }
      for (var evolveTo in node.evolvesTo) {
        queue.add(evolveTo);
        map[getIdFromUrl(evolveTo.species.url)] = UiChainEntry(
            pId: getIdFromUrl(evolveTo.species.url),
            prevId: nodeId,
            trigger: evolveTo.evolutionDetails.firstOrNull?.item?.name ?? "0",
            isLeaf: false
        );
      }
    }
    final chains = List<UiChainEntry?>.of([]);
    map.forEach((key, value) {
      chains.add(value);
    });
    List<List<UiChainEntry>> x = chains.where((it) => it?.isLeaf == true).map((leaf) {
      final list = List<UiChainEntry>.of([]);
      UiChainEntry? entry = leaf;
      while (entry != null) {
        list.add(entry);
        entry = chains.firstWhere((it) {
          return it?.pId == entry?.prevId;
        }, orElse: () => null);
      }
      return list.reversed.toList();
    }).toList();

    return x;
  }
}