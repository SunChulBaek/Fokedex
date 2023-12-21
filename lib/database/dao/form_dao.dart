import 'package:injectable/injectable.dart';

import '../fokedex_database.dart';
import '../model/form_entity.dart';
import '../../data/type_converter.dart';

@injectable
class FormDao {
  static const String _tableName = "form";
  static const String _columnFId = "f_id";
  static const String _columnNames = "names";

  Future<FormEntity?> findById(int id) async {
    final db = await FokedexDatabase.getInstance();
    final form = await db.query(_tableName,
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
    final db = await FokedexDatabase.getInstance();
    await db.insert(_tableName, {
      _columnFId: form.id,
      _columnNames: TypeConverter.namesToString(form.names)
    });
  }
}