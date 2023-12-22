import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../fokedex_database.dart';
import '../model/species_entity.dart';
import '../../data/type_converter.dart';

@injectable
class SpeciesDao {
  static const String _tableName = "species";
  static const String _columnSId = "s_id";
  static const String _columnNames = "names";
  static const String _columnFlavorTexts = "flavor_texts";
  static const String _columnEcId = "ec_id";
  static const String _columnVIds = "v_ids";

  Future<SpeciesEntity?> findById(int id) async {
    final db = await FokedexDatabase.getInstance();
    final species = await db.query(_tableName,
        where: "$_columnSId = ?",
        whereArgs: [id]
    );
    if (species.isNotEmpty) {
      return SpeciesEntity(
        id: int.parse(species[0][_columnSId].toString()),
        names: TypeConverter.stringToNames(species[0][_columnNames].toString()),
        flavorTexts: TypeConverter.stringToFlavors(species[0][_columnFlavorTexts].toString()),
        ecId: species[0][_columnEcId] != null ? int.parse(species[0][_columnEcId].toString()) : 0,
        vIds: TypeConverter.stringToIds(species[0][_columnVIds].toString())
      );
    } else {
      return null;
    }
  }

  Future<List<SpeciesEntity>> selectAll() async {
    final db = await FokedexDatabase.getInstance();
    final species = await db.query(_tableName);
    return species.map((e) =>
      SpeciesEntity(
        id: int.parse(e[_columnSId].toString()),
        names: TypeConverter.stringToNames(e[_columnNames].toString()),
        flavorTexts: TypeConverter.stringToFlavors(e[_columnFlavorTexts].toString()),
        ecId: e[_columnEcId] != null ? int.parse(e[_columnEcId].toString()) : 0,
        vIds: TypeConverter.stringToIds(e[_columnVIds].toString())
      )
    ).toList();
  }

  Future<void> insert(SpeciesEntity species) async {
    final db = await FokedexDatabase.getInstance();
    await db.insert(_tableName, {
      _columnSId: species.id,
      _columnNames: TypeConverter.namesToString(species.names),
      _columnFlavorTexts: TypeConverter.flavorsToString(species.flavorTexts),
      _columnEcId: species.ecId,
      _columnVIds: TypeConverter.idsToString(species.vIds),
    }, conflictAlgorithm: ConflictAlgorithm.ignore);
  }
}