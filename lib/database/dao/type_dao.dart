import 'package:injectable/injectable.dart';

import '../fokedex_database.dart';
import '../model/type_entity.dart';
import '../../data/type_converter.dart';

@injectable
class TypeDao {
  static const String _tableName = "type";
  static const String _columnTId = "t_id";
  static const String _columnNames = "names";

  Future<TypeEntity?> findById(int id) async {
    final db = await FokedexDatabase.getInstance();
    final type = await db.query(_tableName,
      where: "$_columnTId = ?",
      whereArgs: [id]
    );
    if (type.isNotEmpty) {
      return TypeEntity(
        id: int.parse(type[0][_columnTId].toString()),
        names: TypeConverter.stringToNames(type[0][_columnNames].toString())
      );
    } else {
      return null;
    }
  }

  Future<void> insert(TypeEntity type) async {
    final db = await FokedexDatabase.getInstance();
    await db.insert(_tableName, {
      _columnTId: type.id,
      _columnNames: TypeConverter.namesToString(type.names)
    });
  }
}