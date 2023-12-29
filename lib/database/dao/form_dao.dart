import 'package:floor/floor.dart';

import '../model/form_entity.dart';

@dao
abstract class FormDao {
  @Query("SELECT * FROM form WHERE f_id = :id")
  Future<FormEntity?> findById(int id);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertForm(FormEntity form);
}