import 'package:floor/floor.dart';

import '../model/type_entity.dart';

@dao
abstract class TypeDao {
  @Query("SELECT * FROM type WHERE t_id = :id")
  Future<TypeEntity?> findById(int id);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertType(TypeEntity type);
}