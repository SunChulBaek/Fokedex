import 'package:fokedex/database/model/pokemon_item_entity.dart';
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
    @Named("remote") this._remote,
    @Named("local") this._local,
  );

  final PokemonDataSource _remote;
  final PokemonDataSource _local;

  Future<List<Pokemon>> getPokemonList({
    int? limit,
    int? offset
  }) async {
    Timber.i("PokemonRepository.getPokemonList(limit = $limit, offset = $offset)");
    List<PokemonItemEntity> cachedPokemonList;
    if (limit == null && offset == null) {
      //  최초 로딩
      cachedPokemonList = await _local.getPokemonList();
      if (cachedPokemonList.isNotEmpty) {
        return cachedPokemonList.map((item) =>
          item.asExternalModel(fromDB: true)
        ).toList();
      }
    }
    cachedPokemonList = await _local.getPokemonList(limit: limit!, offset: offset!);
    if (cachedPokemonList.isNotEmpty) {
      return cachedPokemonList.map((item) =>
        item.asExternalModel(fromDB: true)
      ).toList();
    } else {
      final pokemonList = await _remote.getPokemonList(limit: limit, offset: offset);
      await _local.insertPokemonList(pokemonList);
      return pokemonList.map((item) =>
        item.asExternalModel()
      ).toList();
    }
  }

  Future<PokemonDetail> getPokemon({
    required int id
  }) async {
    Timber.i("PokemonRepository.getPokemon($id)");
    final cachedPokemon = await _local.getPokemon(id);
    if (cachedPokemon != null) {
      return cachedPokemon.asExternalModel(fromDB: true);
    } else {
      final pokemon = await _remote.getPokemon(id);
      await _local.insertPokemon(pokemon!);
      return pokemon.asExternalModel();
    }
  }

  Future<Species> getSpecies({
    required int id
  }) async {
    Timber.i("PokemonRepository.getSpecies($id)");
    final SpeciesEntity? cachedSpecies = await _local.getSpecies(id);
    if (cachedSpecies != null) {
      return cachedSpecies.asExternalModel(fromDB: true);
    } else {
      final species = await _remote.getSpecies(id);
      await _local.insertSpecies(species!);
      return species.asExternalModel();
    }
  }

  Future<Form> getForm({
    required int id
  }) async {
    Timber.i("PokemonRepository.getForm($id)");
    final cachedForm = await _local.getForm(id);
    if (cachedForm != null) {
      return cachedForm.asExternalModel(fromDB: true);
    } else {
      final form = await _remote.getForm(id);
      await _local.insertForm(form!);
      return form.asExternalModel();
    }
  }

  Future<Type> getType({
    required int id
  }) async {
    Timber.i("PokemonRepository.getType($id)");
    final cachedType = await _local.getType(id);
    if (cachedType != null) {
      return cachedType.asExternalModel(fromDB: true);
    } else {
      final type = await _remote.getType(id);
      await _local.insertType(type!);
      return type.asExternalModel();
    }
  }

  Future<EvolutionChain> getEvolutionChain({
    required int id
  }) async {
    Timber.i("PokemonRepository.getEvolutionChain($id)");
    final cachedChains = await _local.getEvolutionChain(id);
    if (cachedChains.isNotEmpty) {
      return EvolutionChain.fromEntity(id, cachedChains, fromDB: true);
    } else {
      final chains = await _remote.getEvolutionChain(id);
      for (var chain in chains) {
        await _local.insertEvolutionChain(chain);
      }
      return EvolutionChain.fromEntity(id, chains);
    }
  }
}