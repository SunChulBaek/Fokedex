import 'package:sqflite/sqflite.dart';

import '../model/form_entity.dart';
import '../../data/type_converter.dart';

class FormDao {
  static const String _tableName = "form";
  static const String _columnFId = "f_id";
  static const String _columnNames = "names";

  FormDao(this._db);

  final Database _db;

  Future<FormEntity?> findById(int id) async {
    final form = await _db.query(_tableName,
      where: "$_columnFId = ?",
      whereArgs: [id]
    );
    if (form.isNotEmpty) {
      return FormEntity(
        id: int.parse(form[0][_columnFId].toString()),
        names: TypeConverter.stringToNames(form[0][_columnNames].toString())
      );
    } else {
      return null;
    }
  }

  Future<void> insert(FormEntity form) async {
    await _db.insert(
      _tableName,
      {
        _columnFId: form.id,
        _columnNames: TypeConverter.namesToString(form.names)
      },
      conflictAlgorithm: ConflictAlgorithm.ignore
    );
  }
}