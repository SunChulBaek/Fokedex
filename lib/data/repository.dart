import 'package:flutter_template/data/data_source.dart';
import 'package:flutter_template/data/model/network_pokemon_form.dart';
import 'package:flutter_template/model/pokemon.dart';
import 'package:injectable/injectable.dart';

import 'model/network_evolution_chain.dart';
import 'model/network_pokemon.dart';
import 'model/network_pokemon_species.dart';
import 'model/network_type.dart';

@injectable
class Repository {
  Repository(
    @Named("remote") this._restClient,
    @Named("local") this._localDataSource,
  );

  final DataSource _restClient;
  final DataSource _localDataSource;

  Future<List<Pokemon>> getPokemonList({
    int limit = 20,
    int offset = 0
  }) async {
    final list = await _localDataSource.getPokemonList(limit: limit, offset: offset);
    return list.results.map((e) =>
      Pokemon.from(
        pokemon: e,
        fromDB: true
    )).toList();
  }

  Future<NetworkPokemon> getPokemon({
    required int id
  }) => _restClient.getPokemon(id: id);

  Future<NetworkPokemonSpecies> getSpecies({
    required int id
  }) => _restClient.getSpecies(id: id);

  Future<NetworkPokemonForm> getForm({
    required int id
  }) => _restClient.getForm(id: id);

  Future<NetworkType> getType({
    required int id
  }) => _restClient.getType(id: id);

  Future<NetworkEvolutionChain> getEvolutionChain({
    required int id
  }) => _restClient.getEvolutionChain(id: id);
}