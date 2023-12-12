import 'package:injectable/injectable.dart';

import '../fokedex_database.dart';
import '../model/pokemon_entity.dart';
import '../../data/type_converter.dart';

@injectable
class PokemonDao {
  static const String _tableName = "pokemon";
  static const String _columnPId = "p_id";
  static const String _columnSId = "s_id";
  static const String _columnFId = "f_id";
  static const String _columnName = "name";
  static const String _columnBaseExp = "base_experience";
  static const String _columnHeight = "height";
  static const String _columnWeight = "weight";
  static const String _columnIsDefault = "is_default";
  static const String _columnOrder = "order";
  static const String _columnTypeIds = "typeIds";

  Future<PokemonEntity?> findById(int id) async {
    final db = await FokedexDatabase.getInstance();
    final pokemon = await db.query(_tableName,
        where: "$_columnPId = ?",
        whereArgs: [id]
    );
    if (pokemon.isNotEmpty) {
      return PokemonEntity(
        id: int.parse(pokemon[0][_columnPId].toString()),
        sId: int.parse(pokemon[0][_columnSId].toString()),
        fId: pokemon[0][_columnFId] != null ? int.parse(pokemon[0][_columnFId].toString()) : 0,
        name: pokemon[0][_columnName].toString(),
        baseExp: int.parse(pokemon[0][_columnBaseExp].toString()),
        height: int.parse(pokemon[0][_columnHeight].toString()),
        isDefault: int.parse(pokemon[0][_columnIsDefault].toString()) == 1 ? true : false,
        order: int.parse(pokemon[0][_columnOrder].toString()),
        weight: int.parse(pokemon[0][_columnWeight].toString()),
        typeIds: TypeConverter.stringToIds(pokemon[0][_columnTypeIds].toString())
      );
    } else {
      return null;
    }
  }

  Future<void> insert(PokemonEntity pokemon) async {
    final db = await FokedexDatabase.getInstance();
    await db.insert(_tableName, {
      _columnPId: pokemon.id,
      _columnSId: pokemon.sId,
      _columnFId: pokemon.fId,
      _columnName: pokemon.name,
      _columnBaseExp: pokemon.baseExp,
      _columnHeight: pokemon.height,
      _columnIsDefault: pokemon.isDefault ? 1 : 0,
      _columnOrder: pokemon.order,
      _columnWeight: pokemon.weight,
      _columnTypeIds: TypeConverter.idsToString(pokemon.typeIds)
    });
    return;
  }
}