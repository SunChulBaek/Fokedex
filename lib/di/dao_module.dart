import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../database/dao/evolution_chain_dao.dart';
import '../database/dao/form_dao.dart';
import '../database/dao/pokemon_dao.dart';
import '../database/dao/pokemon_item_dao.dart';
import '../database/dao/species_dao.dart';
import '../database/dao/type_dao.dart';

@module
abstract class DaoModule {

  @injectable
  EvolutionChainDao ecDao(Database db) => EvolutionChainDao(db);

  @injectable
  FormDao formDao(Database db) => FormDao(db);

  @injectable
  PokemonDao pokemonDao(Database db) => PokemonDao(db);

  @injectable
  PokemonItemDao pokemonItemDao(Database db) => PokemonItemDao(db);

  @injectable
  SpeciesDao speciesDao(Database db) => SpeciesDao(db);

  @injectable
  TypeDao typeDao(Database db) => TypeDao(db);
}