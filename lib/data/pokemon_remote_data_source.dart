import 'package:injectable/injectable.dart';

import 'pokemon_data_source.dart';
import 'rest_client.dart';
import '../database/model/evolution_chain_entity.dart';
import '../database/model/form_entity.dart';
import '../database/model/pokemon_item_entity.dart';
import '../database/model/pokemon_entity.dart';
import '../database/model/species_entity.dart';
import '../database/model/type_entity.dart';
import '../util/timber.dart';

@Named("remote")
@Injectable(as: PokemonDataSource)
class PokemonRemoteDataSource implements PokemonDataSource {
  PokemonRemoteDataSource(
    this._client
  );

  final RestClient _client;

  @override
  Future<FormEntity?> getForm({required int id}) async {
    Timber.i("RemoteDataSource.getForm($id)");
    final form = await _client.getForm(id: id);
    return FormEntity.fromNetworkModel(form);
  }

  @override
  Future<void> saveForm({required FormEntity form}) {
    throw UnimplementedError();
  }

  @override
  Future<PokemonEntity?> getPokemon({required int id}) async {
    Timber.i("RemoteDataSource.getPokemon($id)");
    final pokemon = await _client.getPokemon(id: id);
    return PokemonEntity.fromNetworkModel(pokemon);
  }

  @override
  Future<void> savePokemon({required PokemonEntity pokemon}) {
    Timber.i("RemoteDataSource.savePokemon(${pokemon.id})");
    throw UnimplementedError();
  }

  @override
  Future<List<PokemonItemEntity>> getPokemonList({int limit = 20, int offset = 0}) async {
    final list = await _client.getPokemonList(limit: limit, offset: offset);
    var index = 0;
    return list.results.map((e) =>
      PokemonItemEntity.fromNetworkModel(index++, e)
    ).toList();
  }

  @override
  Future<SpeciesEntity?> getSpecies({required int id}) async {
    Timber.i("RemoteDataSource.getSpecies($id)");
    final species = await _client.getSpecies(id: id);
    return SpeciesEntity.fromNetworkModel(species);
  }

  @override
  Future<void> saveSpecies({required SpeciesEntity species}) {
    throw UnimplementedError();
  }

  @override
  Future<TypeEntity?> getType({required int id}) async {
    Timber.i("RemoteDataSource.getType($id)");
    final type = await _client.getType(id: id);
    return TypeEntity.fromNetworkModel(type);
  }

  @override
  Future<void> saveType({required TypeEntity type}) {
    throw UnimplementedError();
  }

  @override
  Future<List<EvolutionChainEntity>> getEvolutionChain({required int id}) async {
    Timber.i("RemoteDataSource.getEvolutionChain($id)");
    final chain = await _client.getEvolutionChain(id: id);
    return EvolutionChainEntity.fromNetworkModel(chain);
  }

  @override
  Future<void> saveEvolutionChain({required EvolutionChainEntity chain}) {
    throw UnimplementedError();
  }
}