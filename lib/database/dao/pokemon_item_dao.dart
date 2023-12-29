import 'package:floor/floor.dart';

import '../model/pokemon_item_entity.dart';

@dao
abstract class PokemonItemDao {
  @Query("SELECT * FROM pokemon_item")
  Future<List<PokemonItemEntity>> selectAll();

  @Query("SELECT * FROM pokemon_item WHERE indexx in (:indexx)")
  Future<List<PokemonItemEntity>> findByIndex(List<int> indexx);

  @Insert(onConflict: OnConflictStrategy.ignore)
  Future<void> insertPokemonItem(List<PokemonItemEntity> pokemonList);
}