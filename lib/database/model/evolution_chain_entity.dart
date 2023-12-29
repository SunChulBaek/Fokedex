import 'dart:collection';

import 'package:floor/floor.dart';

import '../../data/model/network_chain_link.dart';
import '../../data/model/network_evolution_chain.dart';
import '../../util/converter.dart';
import '../../util/triple.dart';

@Entity(
  tableName: "evolution_chain",
  primaryKeys: [ "c_id", "p_id" ]
)
class EvolutionChainEntity {
  EvolutionChainEntity({
    required this.cId,
    required this.pId,
    required this.trigger,
    this.prevId,
    required this.isLeaf
  });

  @ColumnInfo(name: "c_id") final int cId;
  @ColumnInfo(name: "p_id") final int pId;
  @ColumnInfo(name: "trigger") final String trigger;
  @ColumnInfo(name: "prev_id") final int? prevId;
  @ColumnInfo(name: "is_leaf") final bool isLeaf;

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