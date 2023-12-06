import 'model/network_named_api_resource_list.dart';
import 'model/network_pokemon.dart';
import 'model/network_pokemon_form.dart';
import 'model/network_pokemon_species.dart';
import 'model/network_type.dart';
import '../model/evolution_chain.dart';

abstract class PokemonDataSource {

  Future<NetworkNamedAPIResourceList> getPokemonList({
    int limit = 20,
    int offset = 0
  }) => throw Exception("Not Implemented yet.");

  Future<NetworkPokemon> getPokemon({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<NetworkPokemonSpecies?> getSpecies({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<void> saveSpecies({
    required NetworkPokemonSpecies species
  }) => throw Exception("Not Implemented yet.");

  Future<NetworkPokemonForm?> getForm({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<void> saveForm({
    required NetworkPokemonForm form
  }) => throw Exception("Not Implemented yet.");

  Future<NetworkType?> getType({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<void> saveType({
    required NetworkType type
  }) => throw Exception("Not Implemented yet.");

  Future<EvolutionChain?> getEvolutionChain({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<void> saveEvolutionChain({
    required EvolutionChain chain
  }) => throw Exception("Not Implemented yet.");
}