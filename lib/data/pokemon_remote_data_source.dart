import 'package:injectable/injectable.dart';

import 'pokemon_data_source.dart';
import 'rest_client.dart';
import 'model/network_named_api_resource_list.dart';
import 'model/network_pokemon.dart';
import '../database/model/evolution_chain_entity.dart';
import '../database/model/form_entity.dart';
import '../database/model/species_entity.dart';
import '../database/model/type_entity.dart';

@Named("remote")
@Injectable(as: PokemonDataSource)
class PokemonRemoteDataSource implements PokemonDataSource {
  PokemonRemoteDataSource(
    this._client
  );

  final RestClient _client;

  @override
  Future<FormEntity?> getForm({required int id}) async {
    final form = await _client.getForm(id: id);
    return FormEntity.fromNetworkModel(form);
  }

  @override
  Future<void> saveForm({required FormEntity form}) {
    throw UnimplementedError();
  }

  @override
  Future<NetworkPokemon> getPokemon({required int id})
    => _client.getPokemon(id: id);

  @override
  Future<NetworkNamedAPIResourceList> getPokemonList({int limit = 20, int offset = 0})
    => _client.getPokemonList(limit: limit, offset: offset);

  @override
  Future<SpeciesEntity?> getSpecies({required int id}) async {
    final species = await _client.getSpecies(id: id);
    return SpeciesEntity.fromNetworkModel(species);
  }

  @override
  Future<void> saveSpecies({required SpeciesEntity species}) {
    throw UnimplementedError();
  }

  @override
  Future<TypeEntity?> getType({required int id}) async{
    final type = await _client.getType(id: id);
    return TypeEntity.fromNetworkModel(type);
  }

  @override
  Future<void> saveType({required TypeEntity type}) {
    throw UnimplementedError();
  }

  @override
  Future<List<EvolutionChainEntity>> getEvolutionChain({required int id}) async {
    final chain = await _client.getEvolutionChain(id: id);
    return EvolutionChainEntity.fromNetworkModel(chain);
  }

  @override
  Future<void> saveEvolutionChain({required EvolutionChainEntity chain}) {
    throw UnimplementedError();
  }
}