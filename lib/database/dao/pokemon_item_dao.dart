import 'package:sqflite/sqflite.dart';

import '../model/pokemon_item_entity.dart';

class PokemonItemDao {
  static const String _tableName = "pokemon_item";
  static const String _columnId = "id";
  static const String _columnIndexx = "indexx";
  static const String _columnName = "name";

  PokemonItemDao(this._db);

  final Database _db;

  Future<List<PokemonItemEntity>> selectAll() async {
    final pokemonList = await _db.query(_tableName);
    return pokemonList.map((e) => PokemonItemEntity(
      id: int.parse(e[_columnId].toString()),
      index: int.parse(e[_columnIndexx].toString()),
      name: e[_columnName].toString()
    )).toList();
  }

  Future<List<PokemonItemEntity>> findByIndex({
    required List<int> indexx,
  }) async {
    final pokemonList = await _db.query(_tableName,
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
    for (var pokemon in pokemonList) {
      await _db.insert(
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