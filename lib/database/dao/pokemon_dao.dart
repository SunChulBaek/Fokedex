import 'package:floor/floor.dart';

import '../model/pokemon_entity.dart';

@dao
abstract class PokemonDao {
  @Query("SELECT * FROM pokemon WHERE p_id = :id")
  Future<PokemonEntity?> findById(int id);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertPokemon(PokemonEntity pokemon);
}