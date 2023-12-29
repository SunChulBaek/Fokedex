import 'dart:async';

import 'pokemon_data_source.dart';
import '../database/dao/evolution_chain_dao.dart';
import '../database/dao/form_dao.dart';
import '../database/dao/pokemon_dao.dart';
import '../database/dao/pokemon_item_dao.dart';
import '../database/dao/species_dao.dart';
import '../database/dao/type_dao.dart';
import '../database/model/evolution_chain_entity.dart';
import '../database/model/form_entity.dart';
import '../database/model/pokemon_entity.dart';
import '../database/model/pokemon_item_entity.dart';
import '../database/model/species_entity.dart';
import '../database/model/type_entity.dart';

class PokemonLocalDataSource implements PokemonDataSource {

  PokemonLocalDataSource(
    this.ecDao,
    this.formDao,
    this.pokemonDao,
    this.pokemonItemDao,
    this.speciesDao,
    this.typeDao
  );

  final EvolutionChainDao ecDao;
  final FormDao formDao;
  final PokemonDao pokemonDao;
  final PokemonItemDao pokemonItemDao;
  final SpeciesDao speciesDao;
  final TypeDao typeDao;

  @override
  Future<List<PokemonItemEntity>> getPokemonList({
    int? limit,
    int? offset
  }) async {
    if (limit == null && offset == null) {
      return await pokemonItemDao.selectAll();
    }
    final indexx = List<int>.empty(growable: true);
    for (int i = offset!; i < offset + limit!; i++) {
      indexx.add(i);
    }
    return await pokemonItemDao.findByIndex(indexx);
  }

  @override
  Future<void> insertPokemonList(List<PokemonItemEntity> pokemonList)
    => pokemonItemDao.insertPokemonItem(pokemonList);

  @override
  Future<FormEntity?> getForm(int id) => formDao.findById(id);

  @override
  Future<void> insertForm(FormEntity form) => formDao.insertForm(form);

  @override
  Future<PokemonEntity?> getPokemon(int id)  => pokemonDao.findById(id);

  @override
  Future<void> insertPokemon(PokemonEntity pokemon) => pokemonDao.insertPokemon(pokemon);

  @override
  Future<SpeciesEntity?> getSpecies(int id) => speciesDao.findById(id);

  @override
  Future<List<SpeciesEntity>> getAllSpecies() => speciesDao.selectAll();

  @override
  Future<void> insertSpecies(SpeciesEntity species) => speciesDao.insertSpecies(species);

  @override
  Future<TypeEntity?> getType(int id) => typeDao.findById(id);

  @override
  Future<void> insertType(TypeEntity type) => typeDao.insertType(type);

  @override
  Future<List<EvolutionChainEntity>> getEvolutionChain(int id) => ecDao.findById(id);

  @override
  Future<void> insertEvolutionChain(EvolutionChainEntity chain) => ecDao.insertEvolutionChain(chain);
}