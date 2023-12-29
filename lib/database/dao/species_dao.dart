import 'package:floor/floor.dart';

import '../model/species_entity.dart';

@dao
abstract class SpeciesDao {
  @Query("SELECT * FROM species")
  Future<List<SpeciesEntity>> selectAll();

  @Query("SELECT * FROM species WHERE s_id = :id")
  Future<SpeciesEntity?> findById(int id);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertSpecies(SpeciesEntity species);
}