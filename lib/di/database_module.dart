import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

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

  @preResolve
  Future<Database> get database async {
    const dbName = "fokedex-database-1280.db";
    final databasePath = await getDatabasesPath();
    final path = "$databasePath/$dbName";
    final exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      Timber.i("Creating new copy from asset");
      // Make sure the parent directory exists
      try {
        await Directory(path.substring(0, path.lastIndexOf("/"))).create(recursive: true);
      } catch (_) { }

      // Copy from asset
      ByteData data = await rootBundle.load("assets/$dbName");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      Timber.i("Opening existing database");
    }

    return await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          await db.execute("CREATE TABLE IF NOT EXISTS `pokemon_item` (`id` INTEGER NOT NULL, `indexx` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY(`id`))");
          await db.execute("CREATE TABLE IF NOT EXISTS `pokemon` (`p_id` INTEGER NOT NULL, `s_id` INTEGER NOT NULL, `f_id` INTEGER NOT NULL, `name` TEXT, `base_experience` INTEGER NOT NULL, `height` INTEGER NOT NULL, `is_default` INTEGER NOT NULL, `order` INTEGER NOT NULL, `weight` INTEGER NOT NULL, `typeIds` TEXT NOT NULL, PRIMARY KEY(`p_id`))");
          await db.execute("CREATE TABLE IF NOT EXISTS `species` (`s_id` INTEGER NOT NULL, `names` TEXT NOT NULL, `flavor_texts` TEXT NOT NULL, `ec_id` INTEGER, `v_ids` TEXT, PRIMARY KEY(`s_id`))");
          await db.execute("CREATE TABLE IF NOT EXISTS `type` (`t_id` INTEGER NOT NULL, `names` TEXT NOT NULL, PRIMARY KEY(`t_id`))");
          await db.execute("CREATE TABLE IF NOT EXISTS `stat` (`s_id` INTEGER NOT NULL, `name` TEXT, PRIMARY KEY(`s_id`))");
          await db.execute("CREATE TABLE IF NOT EXISTS `value` (`p_id` INTEGER NOT NULL, `s_id` INTEGER NOT NULL, `value` INTEGER NOT NULL, PRIMARY KEY(`p_id`, `s_id`))");
          await db.execute("CREATE TABLE IF NOT EXISTS `form` (`f_id` INTEGER NOT NULL, `names` TEXT NOT NULL, PRIMARY KEY(`f_id`))");
          await db.execute("CREATE TABLE IF NOT EXISTS `evolution_chain` (`c_id` INTEGER NOT NULL, `p_id` INTEGER NOT NULL, `trigger` TEXT NOT NULL, `prev_id` INTEGER, `is_leaf` INTEGER NOT NULL, PRIMARY KEY(`c_id`, `p_id`))");
          await db.execute("CREATE TABLE IF NOT EXISTS `p2s` (`p_id` INTEGER NOT NULL, `s_id` INTEGER NOT NULL, PRIMARY KEY(`p_id`, `s_id`))");
          await db.execute("CREATE INDEX IF NOT EXISTS `index_p2s_s_id` ON `p2s` (`s_id`)");
          await db.execute("CREATE TABLE IF NOT EXISTS `p2t` (`p_id` INTEGER NOT NULL, `t_id` INTEGER NOT NULL, PRIMARY KEY(`p_id`, `t_id`))");
          await db.execute("CREATE INDEX IF NOT EXISTS `index_p2t_t_id` ON `p2t` (`t_id`)");
        }
    );
  }
}