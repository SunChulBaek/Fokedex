import 'package:injectable/injectable.dart';

import '../fokedex_database.dart';
import '../model/pokemon_item_entity.dart';

@injectable
class PokemonItemDao {
  static const String _tableName = "pokemon_item";
  static const String _columnId = "id";
  static const String _columnIndexx = "indexx";
  static const String _columnName = "name";

  Future<List<PokemonItemEntity>> get({
    required int limit,
    required int offset,
  }) async {
    final db = await FokedexDatabase.getInstance();
    final pokemonList = await db.query(_tableName);
    return pokemonList.map((e) => PokemonItemEntity(
      id: int.parse(e[_columnId].toString()),
      index: int.parse(e[_columnIndexx].toString()),
      name: e[_columnName].toString()
    )).toList();
  }
}