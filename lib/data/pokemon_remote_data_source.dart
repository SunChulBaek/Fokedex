import 'package:injectable/injectable.dart';

import 'pokemon_data_source.dart';
import 'rest_client.dart';
import 'model/network_named_api_resource_list.dart';
import 'model/network_pokemon.dart';
import 'model/network_pokemon_form.dart';
import 'model/network_pokemon_species.dart';
import 'model/network_type.dart';
import '../model/evolution_chain.dart';

@Named("remote")
@Injectable(as: PokemonDataSource)
class PokemonRemoteDataSource implements PokemonDataSource {
  PokemonRemoteDataSource(
    this._client
  );

  final RestClient _client;

  @override
  Future<NetworkPokemonForm?> getForm({required int id})
    => _client.getForm(id: id);

  @override
  Future<void> saveForm({required NetworkPokemonForm form}) {
    throw UnimplementedError();
  }

  @override
  Future<NetworkPokemon> getPokemon({required int id})
    => _client.getPokemon(id: id);

  @override
  Future<NetworkNamedAPIResourceList> getPokemonList({int limit = 20, int offset = 0})
    => _client.getPokemonList(limit: limit, offset: offset);

  @override
  Future<NetworkPokemonSpecies?> getSpecies({required int id})
    => _client.getSpecies(id: id);

  @override
  Future<void> saveSpecies({required NetworkPokemonSpecies species}) {
    throw UnimplementedError();
  }

  @override
  Future<NetworkType?> getType({required int id})
    => _client.getType(id: id);

  @override
  Future<void> saveType({required NetworkType type}) {
    throw UnimplementedError();
  }

  @override
  Future<EvolutionChain> getEvolutionChain({required int id}) async {
    final chain = await _client.getEvolutionChain(id: id);
    return EvolutionChain.fromNetworkModel(chain);
  }

  @override
  Future<void> saveEvolutionChain({required EvolutionChain chain}) {
    throw UnimplementedError();
  }
}