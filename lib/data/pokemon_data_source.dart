import 'model/network_named_api_resource_list.dart';
import 'model/network_pokemon.dart';
import '../database/model/form_entity.dart';
import '../database/model/species_entity.dart';
import '../database/model/type_entity.dart';
import '../model/evolution_chain.dart';

abstract class PokemonDataSource {

  Future<NetworkNamedAPIResourceList> getPokemonList({
    int limit = 20,
    int offset = 0
  }) => throw Exception("Not Implemented yet.");

  Future<NetworkPokemon> getPokemon({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<SpeciesEntity?> getSpecies({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<void> saveSpecies({
    required SpeciesEntity species
  }) => throw Exception("Not Implemented yet.");

  Future<FormEntity?> getForm({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<void> saveForm({
    required FormEntity form
  }) => throw Exception("Not Implemented yet.");

  Future<TypeEntity?> getType({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<void> saveType({
    required TypeEntity type
  }) => throw Exception("Not Implemented yet.");

  Future<EvolutionChain?> getEvolutionChain({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<void> saveEvolutionChain({
    required EvolutionChain chain
  }) => throw Exception("Not Implemented yet.");
}