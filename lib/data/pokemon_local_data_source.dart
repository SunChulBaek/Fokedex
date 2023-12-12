import 'dart:async';

import 'package:injectable/injectable.dart';

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

@Named("local")
@Injectable(as: PokemonDataSource)
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
    int limit = 20,
    int offset = 0
  }) => pokemonItemDao.get(limit: limit, offset: offset);

  @override
  Future<FormEntity?> getForm(int id) => formDao.findById(id);

  @override
  Future<void> insertForm(FormEntity form) => formDao.insert(form);

  @override
  Future<PokemonEntity?> getPokemon(int id)  => pokemonDao.findById(id);

  @override
  Future<void> insertPokemon(PokemonEntity pokemon) => pokemonDao.insert(pokemon);

  @override
  Future<SpeciesEntity?> getSpecies(int id) => speciesDao.findById(id);

  @override
  Future<void> insertSpecies(SpeciesEntity species) => speciesDao.insert(species);

  @override
  Future<TypeEntity?> getType(int id) => typeDao.findById(id);

  @override
  Future<void> insertType(TypeEntity type) => typeDao.insert(type);

  @override
  Future<List<EvolutionChainEntity>> getEvolutionChain(int id) => ecDao.findById(id);

  @override
  Future<void> insertEvolutionChain(EvolutionChainEntity chain) => ecDao.insert(chain);
}