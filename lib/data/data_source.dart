import 'model/network_evolution_chain.dart';
import 'model/network_named_api_resource_list.dart';
import 'model/network_pokemon.dart';
import 'model/network_pokemon_form.dart';
import 'model/network_pokemon_species.dart';
import 'model/network_type.dart';

abstract class DataSource {

  Future<NetworkNamedAPIResourceList> getPokemonList({
    int limit = 20,
    int offset = 0
  }) => throw Exception("Not Implemented yet.");

  Future<NetworkPokemon> getPokemon({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<NetworkPokemonSpecies> getSpecies({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<NetworkPokemonForm> getForm({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<NetworkType> getType({
    required int id
  }) => throw Exception("Not Implemented yet.");

  Future<NetworkEvolutionChain> getEvolutionChain({
    required int id
  }) => throw Exception("Not Implemented yet.");
}