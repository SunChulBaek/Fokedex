import 'package:injectable/injectable.dart';

import 'model/network_evolution_chain.dart';
import 'model/network_named_api_resource_list.dart';
import 'model/network_pokemon.dart';
import 'model/network_pokemon_species.dart';
import 'model/network_type.dart';
import 'rest_client.dart';

@injectable
class Repository {
  Repository(this._restClient);

  final RestClient _restClient;

  Future<NetworkNamedAPIResourceList> getPokemonList({
    int limit = 20,
    int offset = 0
  }) => _restClient.getPokemonList(limit: limit, offset: offset);

  Future<NetworkPokemon> getPokemon({
    required int id
  }) => _restClient.getPokemon(id: id);

  Future<NetworkPokemonSpecies> getSpecies({
    required int id
  }) => _restClient.getSpecies(id: id);

  Future<NetworkType> getType({
    required int id
  }) => _restClient.getType(id: id);

  Future<NetworkEvolutionChain> getEvolutionChain({
    required int id
  }) => _restClient.getEvolutionChain(id: id);
}