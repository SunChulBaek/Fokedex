import 'dart:collection';

import '../../data/model/network_chain_link.dart';
import '../../data/model/network_evolution_chain.dart';
import '../../util/converter.dart';
import '../../util/triple.dart';

class EvolutionChainEntity {
  EvolutionChainEntity({
    required this.cId,
    required this.pId,
    required this.trigger,
    this.prevId,
    required this.isLeaf
  });

  final int cId;
  final int pId;
  final String trigger;
  final int? prevId;
  final bool isLeaf;

  static List<EvolutionChainEntity> fromNetworkModel(NetworkEvolutionChain chain) {
    final map = HashMap<int, Triple<int?, String, bool>>();
    final queue = Queue<NetworkChainLink>()..add(chain.chain);
    while (queue.isNotEmpty) {
      final node = queue.removeFirst();
      final nodeId = getIdFromUrl(node.species.url);
      if (!map.containsKey(nodeId)) {
        map[nodeId] = Triple(
          0,
          node.evolutionDetails.firstOrNull?.item?.name ?? "0",
          false
        );
      }
      if (node.evolvesTo.isEmpty) {
        final nodex = map[getIdFromUrl(node.species.url)];
        if (nodex != null) {
          map[nodeId] = nodex.copy(
            third: true
          );
        }
      }
      for (var evolveTo in node.evolvesTo) {
        queue.add(evolveTo);
        map[getIdFromUrl(evolveTo.species.url)] = Triple(
          nodeId,
          evolveTo.evolutionDetails.firstOrNull?.item?.name ?? "0",
          false
        );
      }
    }
    return map.entries.map((e) {
      final key = e.key;
      final value = e.value;

      final prevId = value.first;
      final sName = value.second;
      final isLeaf = value.third;

      return EvolutionChainEntity(
        cId: chain.id,
        pId: key,
        trigger: sName,
        prevId: prevId,
        isLeaf: isLeaf
      );
    }).toList();
  }
}