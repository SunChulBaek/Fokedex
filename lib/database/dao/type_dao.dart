import 'package:sqflite/sqflite.dart';

import '../model/type_entity.dart';
import '../../data/type_converter.dart';

class TypeDao {
  static const String _tableName = "type";
  static const String _columnTId = "t_id";
  static const String _columnNames = "names";

  TypeDao(this._db);

  final Database _db;

  Future<TypeEntity?> findById(int id) async {
    final type = await _db.query(_tableName,
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
    await _db.insert(
      _tableName,
      {
        _columnTId: type.id,
        _columnNames: TypeConverter.namesToString(type.names)
      },
      conflictAlgorithm: ConflictAlgorithm.ignore
    );
  }
}