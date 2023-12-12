import '../database/model/pokemon_entity.dart';
import '../database/model/pokemon_item_entity.dart';
import '../database/model/evolution_chain_entity.dart';
import '../database/model/form_entity.dart';
import '../database/model/species_entity.dart';
import '../database/model/type_entity.dart';

abstract class PokemonDataSource {

  Future<List<PokemonItemEntity>> getPokemonList({
    int limit = 20,
    int offset = 0
  }) => throw Exception("Not Implemented yet.");

  Future<PokemonEntity?> getPokemon(int id)
    => throw Exception("Not Implemented yet.");

  Future<void> insertPokemon(PokemonEntity pokemon)
    => throw Exception("Not Implemented yet.");

  Future<SpeciesEntity?> getSpecies(int id)
    => throw Exception("Not Implemented yet.");

  Future<void> insertSpecies(SpeciesEntity species)
    => throw Exception("Not Implemented yet.");

  Future<FormEntity?> getForm(int id)
    => throw Exception("Not Implemented yet.");

  Future<void> insertForm(FormEntity form)
    => throw Exception("Not Implemented yet.");

  Future<TypeEntity?> getType(int id)
    => throw Exception("Not Implemented yet.");

  Future<void> insertType(TypeEntity type)
    => throw Exception("Not Implemented yet.");

  Future<List<EvolutionChainEntity>> getEvolutionChain(int id)
    => throw Exception("Not Implemented yet.");

  Future<void> insertEvolutionChain(EvolutionChainEntity chain)
    => throw Exception("Not Implemented yet.");
}