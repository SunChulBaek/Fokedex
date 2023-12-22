import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../fokedex_database.dart';
import '../model/evolution_chain_entity.dart';

@injectable
class EvolutionChainDao {
  static const String _tableName = "evolution_chain";
  static const String _columnCId = "c_id";
  static const String _columnPId = "p_id";
  static const String _columnPrevId = "prev_id";
  static const String _columnTrigger = "trigger";
  static const String _columnIsLeaf = "is_leaf";

  Future<List<EvolutionChainEntity>> findById(int id) async {
    final db = await FokedexDatabase.getInstance();
    final chains = await db.query(_tableName,
      where: "$_columnCId = ?",
      whereArgs: [id]
    );
    return chains.map((leaf) =>
      EvolutionChainEntity(
        cId: id,
        pId: leaf[_columnPId] as int,
        prevId: (leaf[_columnPrevId] as int?) ?? 0,
        trigger: leaf[_columnTrigger] as String,
        isLeaf: (leaf[_columnIsLeaf] as int) == 1 ? true : false
      )
    ).toList();
  }

  Future<void> insert(EvolutionChainEntity chain) async {
    final db = await FokedexDatabase.getInstance();
    await db.insert(_tableName, {
      _columnCId: chain.cId,
      _columnPId: chain.pId,
      _columnTrigger: chain.trigger,
      _columnPrevId: chain.prevId,
      _columnIsLeaf: chain.isLeaf ? 1 : 0
    }, conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}