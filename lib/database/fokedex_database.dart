// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'converters/ids_converter.dart';
import 'converters/lang_value_converter.dart';
import 'converters/lang_value_version_converter.dart';
import 'dao/evolution_chain_dao.dart';
import 'dao/form_dao.dart';
import 'dao/pokemon_dao.dart';
import 'dao/pokemon_item_dao.dart';
import 'dao/species_dao.dart';
import 'dao/type_dao.dart';
import 'model/evolution_chain_entity.dart';
import 'model/form_entity.dart';
import 'model/pokemon_entity.dart';
import 'model/pokemon_item_entity.dart';
import 'model/species_entity.dart';
import 'model/type_entity.dart';

part 'fokedex_database.g.dart';

@Database(
  version: 1,
  entities: [
    EvolutionChainEntity,
    FormEntity,
    PokemonEntity,
    PokemonItemEntity,
    SpeciesEntity,
    TypeEntity
  ]
)
@TypeConverters([
  IdsConverter,
  IdsConverter2,
  LangValueConverter,
  LangValueVersionConverter
])
abstract class FokedexDatabase extends FloorDatabase {
  EvolutionChainDao get evolutionChainDao;
  FormDao get formDao;
  PokemonDao get pokemonDao;
  PokemonItemDao get pokemonItemDao;
  SpeciesDao get speciesDao;
  TypeDao get typeDao;
}