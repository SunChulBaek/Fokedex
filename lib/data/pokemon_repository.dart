import 'package:injectable/injectable.dart';

import 'pokemon_data_source.dart';
import '../database/model/species_entity.dart';
import '../model/evolution_chain.dart';
import '../model/form.dart';
import '../model/pokemon.dart';
import '../model/pokemon_detail.dart';
import '../model/species.dart';
import '../model/type.dart';
import '../util/timber.dart';

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
    Timber.i("PokemonRepository.getPokemonList(limit = $limit, offset = $offset)");
    final list = await _localDataSource.getPokemonList(limit: limit, offset: offset);
    return list.map((item) => item.asExternalModel(fromDB: true)).toList();
  }

  Future<PokemonDetail> getPokemon({
    required int id
  }) async {
    Timber.i("PokemonRepository.getPokemon($id)");
    final cachedPokemon = await _localDataSource.getPokemon(id);
    if (cachedPokemon != null) {
      return cachedPokemon.asExternalModel(fromDB: true);
    } else {
      final pokemon = await _restClient.getPokemon(id);
      await _localDataSource.insertPokemon(pokemon!);
      return pokemon.asExternalModel();
    }
  }

  Future<Species> getSpecies({
    required int id
  }) async {
    Timber.i("PokemonRepository.getSpecies($id)");
    final SpeciesEntity? cachedSpecies = await _localDataSource.getSpecies(id);
    if (cachedSpecies != null) {
      return cachedSpecies.asExternalModel(fromDB: true);
    } else {
      final species = await _restClient.getSpecies(id);
      await _localDataSource.insertSpecies(species!);
      return species.asExternalModel();
    }
  }

  Future<Form> getForm({
    required int id
  }) async {
    Timber.i("PokemonRepository.getForm($id)");
    final cachedForm = await _localDataSource.getForm(id);
    if (cachedForm != null) {
      return cachedForm.asExternalModel(fromDB: true);
    } else {
      final form = await _restClient.getForm(id);
      await _localDataSource.insertForm(form!);
      return form.asExternalModel();
    }
  }

  Future<Type> getType({
    required int id
  }) async {
    Timber.i("PokemonRepository.getType($id)");
    final cachedType = await _localDataSource.getType(id);
    if (cachedType != null) {
      return cachedType.asExternalModel(fromDB: true);
    } else {
      final type = await _restClient.getType(id);
      await _localDataSource.insertType(type!);
      return type.asExternalModel();
    }
  }

  Future<EvolutionChain> getEvolutionChain({
    required int id
  }) async {
    Timber.i("PokemonRepository.getEvolutionChain($id)");
    final cachedChains = await _localDataSource.getEvolutionChain(id);
    if (cachedChains.isNotEmpty) {
      return EvolutionChain.fromEntity(id, cachedChains, fromDB: true);
    } else {
      final chains = await _restClient.getEvolutionChain(id);
      for (var chain in chains) {
        await _localDataSource.insertEvolutionChain(chain);
      }
      return EvolutionChain.fromEntity(id, chains);
    }
  }
}