import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../fokedex_database.dart';
import '../model/pokemon_item_entity.dart';

@injectable
class PokemonItemDao {
  static const String _tableName = "pokemon_item";
  static const String _columnId = "id";
  static const String _columnIndexx = "indexx";
  static const String _columnName = "name";

  Future<List<PokemonItemEntity>> findByIndex({
    required List<int> indexx,
  }) async {
    final db = await FokedexDatabase.getInstance();
    final pokemonList = await db.query(_tableName,
      where: "$_columnIndexx IN (${List.filled(indexx.length, "?").join(",")})",
      whereArgs: indexx
    );
    return pokemonList.map((e) => PokemonItemEntity(
      id: int.parse(e[_columnId].toString()),
      index: int.parse(e[_columnIndexx].toString()),
      name: e[_columnName].toString()
    )).toList();
  }

  Future<void> insert(List<PokemonItemEntity> pokemonList) async {
    final db = await FokedexDatabase.getInstance();
    for (var pokemon in pokemonList) {
      await db.insert(
        _tableName, {
          _columnId: pokemon.id,
          _columnIndexx: pokemon.index,
          _columnName: pokemon.name
        },
        conflictAlgorithm: ConflictAlgorithm.ignore
      );
    }
    return;
  }
}