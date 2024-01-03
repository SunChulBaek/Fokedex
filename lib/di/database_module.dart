import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../database/fokedex_database.dart';
import '../database/dao/evolution_chain_dao.dart';
import '../database/dao/form_dao.dart';
import '../database/dao/pokemon_dao.dart';
import '../database/dao/pokemon_item_dao.dart';
import '../database/dao/species_dao.dart';
import '../database/dao/type_dao.dart';
import '../util/timber.dart';

@module
abstract class DatabaseModule {

  @injectable
  EvolutionChainDao ecDao(FokedexDatabase db) => db.evolutionChainDao;

  @injectable
  FormDao formDao(FokedexDatabase db) => db.formDao;

  @injectable
  PokemonDao pokemonDao(FokedexDatabase db) => db.pokemonDao;

  @injectable
  PokemonItemDao pokemonItemDao(FokedexDatabase db) => db.pokemonItemDao;

  @injectable
  SpeciesDao speciesDao(FokedexDatabase db) => db.speciesDao;

  @injectable
  TypeDao typeDao(FokedexDatabase db) => db.typeDao;

  @preResolve
  Future<FokedexDatabase> get database async {
    const srcDbName = "cokedex-database.db";
    final databasePath = await getDatabasesPath();
    final destPath = "$databasePath/fokedex-database.db";
    final exists = await databaseExists(destPath);

    if (!exists) {
      // Should happen only the first time you launch your application
      Timber.i("Creating new copy from asset");
      // Make sure the parent directory exists
      try {
        await Directory(destPath.substring(0, destPath.lastIndexOf("/"))).create(recursive: true);
      } catch (_) { }

      // Copy from asset
      ByteData data = await rootBundle.load("assets/$srcDbName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(destPath).writeAsBytes(bytes, flush: true);
    } else {
      Timber.i("Opening existing database");
    }

    return await $FloorFokedexDatabase
      .databaseBuilder("fokedex-database.db")
      .build();
  }
}