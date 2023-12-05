import 'package:injectable/injectable.dart';

import 'model/network_evolution_chain.dart';
import 'model/network_named_api_resource_list.dart';
import 'model/network_pokemon.dart';
import 'model/network_pokemon_form.dart';
import 'model/network_pokemon_species.dart';
import 'model/network_type.dart';
import 'pokemon_data_source.dart';
import 'rest_client.dart';

@Named("remote")
@Injectable(as: PokemonDataSource)
class PokemonRemoteDataSource implements PokemonDataSource {
  PokemonRemoteDataSource(
    this._client
  );

  final RestClient _client;

  @override
  Future<NetworkEvolutionChain> getEvolutionChain({required int id})
    => _client.getEvolutionChain(id: id);

  @override
  Future<NetworkPokemonForm> getForm({required int id})
    => _client.getForm(id: id);

  @override
  Future<NetworkPokemon> getPokemon({required int id})
    => _client.getPokemon(id: id);

  @override
  Future<NetworkNamedAPIResourceList> getPokemonList({int limit = 20, int offset = 0})
    => _client.getPokemonList(limit: limit, offset: offset);

  @override
  Future<NetworkPokemonSpecies> getSpecies({required int id})
    => _client.getSpecies(id: id);

  @override
  Future<NetworkType?> getType({required int id})
    => _client.getType(id: id);

  @override
  Future<void> saveType({required NetworkType type}) {
    throw UnimplementedError();
  }
}