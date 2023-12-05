import 'package:injectable/injectable.dart';

import 'pokemon_data_source.dart';
import 'model/network_evolution_chain.dart';
import 'model/network_pokemon.dart';
import 'model/network_pokemon_species.dart';
import '../model/form.dart';
import '../model/pokemon.dart';
import '../model/type.dart';

@injectable
class PokemonRepository {
  PokemonRepository(
    @Named("remote") this._restClient,
    @Named("local") this._localDataSource,
  );

  final PokemonDataSource _restClient;
  final PokemonDataSource _localDataSource;

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

  Future<Form> getForm({
    required int id
  }) async {
    final formFromDB = await _localDataSource.getForm(id: id);
    if (formFromDB != null) {
      return Form.fromNetworkModel(formFromDB, fromDB: true);
    } else {
      final form = await _restClient.getForm(id: id);
      await _localDataSource.saveForm(form: form!);
      return Form.fromNetworkModel(form);
    }
  }

  Future<Type> getType({
    required int id
  }) async {
    final typeFromDB = await _localDataSource.getType(id: id);
    if (typeFromDB != null) {
      return Type.fromNetworkModel(typeFromDB, fromDB: true);
    } else {
      final type = await _restClient.getType(id: id);
      await _localDataSource.saveType(type: type!);
      return Type.fromNetworkModel(type);
    }
  }

  Future<NetworkEvolutionChain> getEvolutionChain({
    required int id
  }) => _restClient.getEvolutionChain(id: id);
}