import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import 'pokemon_data_source.dart';
import 'type_converter.dart';
import '../database/model/evolution_chain_entity.dart';
import '../database/model/form_entity.dart';
import '../database/model/pokemon_entity.dart';
import '../database/model/pokemon_item_entity.dart';
import '../database/model/species_entity.dart';
import '../database/model/type_entity.dart';
import '../util/timber.dart';

@Named("local")
@Injectable(as: PokemonDataSource)
class PokemonLocalDataSource implements PokemonDataSource {
  static const dbName = "cokedex-database.db";

  Database? _db;

  @override
  Future<List<PokemonItemEntity>> getPokemonList({
    int limit = 20,
    int offset = 0
  }) async {
    final db = await getDb();
    final pokemonList = await db.query("pokemon_item");
    Timber.i("LocalDataSource.getPokemonList(${pokemonList.length})");
    return pokemonList.map((e) => PokemonItemEntity(
      id: int.parse(e["id"].toString()),
      index: int.parse(e["indexx"].toString()),
      name: e["name"].toString()
    )).toList();
  }

  @override
  Future<FormEntity?> getForm({
    required int id
  }) async {
    Timber.i("LocalDataSource.getForm($id)");
    final db = await getDb();
    final form = await db.query("form",
      where: "f_id = ?",
      whereArgs: [id]
    );
    if (form.isNotEmpty) {
      return FormEntity(
        id: int.parse(form[0]["f_id"].toString()),
        names: TypeConverter.stringToNames2(form[0]["names"].toString())
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> saveForm({required FormEntity form}) async {
    Timber.i("LocalDataSource.getSpecies(${form.id})");
    final db = await getDb();
    await db.insert("form", {
      "f_id": form.id,
      "names": TypeConverter.namesToString2(form.names)
    });
  }

  @override
  Future<PokemonEntity?> getPokemon({
    required int id
  }) async {
    // TODO: implement getPokemon
    return null;
  }

  @override
  Future<void> savePokemon({required PokemonEntity pokemon}) async {
    // TODO: implement savePokemon
    return;
  }

  @override
  Future<SpeciesEntity?> getSpecies({
    required int id
  }) async {
    Timber.i("LocalDataSource.getSpecies($id)");
    final db = await getDb();
    final species = await db.query("species",
      where: "s_id = ?",
      whereArgs: [id]
    );
    if (species.isNotEmpty) {
      return SpeciesEntity(
        id: int.parse(species[0]["s_id"].toString()),
        names: TypeConverter.stringToNames2(species[0]["names"].toString()),
        flavorTexts: TypeConverter.stringToFlavors2(species[0]["flavor_texts"].toString()),
        ecId: species[0]["ec_id"] != null ? int.parse(species[0]["ec_id"].toString()) : 0,
        vIds: TypeConverter.stringToVarieties2(species[0]["v_ids"].toString())
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> saveSpecies({required SpeciesEntity species}) async {
    Timber.i("LocalDataSource.saveSpecies(${species.id})");
    final db = await getDb();
    await db.insert("species", {
      "s_id": species.id,
      "names": TypeConverter.namesToString2(species.names),
      "flavor_texts": TypeConverter.flavorsToString2(species.flavorTexts),
      "ec_id": species.ecId,
      "v_ids": TypeConverter.varietiesToString2(species.vIds),
    });
  }

  @override
  Future<TypeEntity?> getType({
    required int id
  }) async {
    Timber.i("LocalDataSource.getType($id)");
    final db = await getDb();
    final type = await db.query(
      "type",
      where: "t_id = ?",
      whereArgs: [id]
    );
    if (type.isNotEmpty) {
      return TypeEntity(
        id: int.parse(type[0]["t_id"].toString()),
        names: TypeConverter.stringToNames2(type[0]["names"].toString())
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> saveType({required TypeEntity type}) async {
    Timber.i("LocalDataSource.saveType(${type.id})");
    final db = await getDb();
    await db.insert("type", {
      "t_id": type.id,
      "names": TypeConverter.namesToString2(type.names)
    });
  }

  @override
  Future<List<EvolutionChainEntity>> getEvolutionChain({
    required int id
  }) async {
    Timber.i("PokemonLocalDataSource.getEvolutionChain($id)");
    final db = await getDb();
    final chains = await db.query("evolution_chain",
      where: "c_id = ?",
      whereArgs: [id]
    );
    return chains.map((leaf) =>
      EvolutionChainEntity(
        cId: id,
        pId: leaf["p_id"] as int,
        prevId: (leaf["prev_id"] as int?) ?? 0,
        trigger: leaf["trigger"] as String,
        isLeaf: (leaf["is_leaf"] as int) == 1 ? true : false
      )
    ).toList();
  }

  @override
  Future<void> saveEvolutionChain({required EvolutionChainEntity chain}) async {
    Timber.i("PokemonLocalDataSource.saveEvolutionChain(p_id = ${chain.pId}, prev_id = ${chain.prevId})");
    final db = await getDb();
    await db.insert("evolution_chain", {
      "c_id": chain.cId,
      "p_id": chain.pId,
      "trigger": chain.trigger,
      "prev_id": chain.prevId,
      "is_leaf": chain.isLeaf ? 1 : 0
    });
  }

  Future<Database> getDb() async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb();
      return _db!;
    }
  }

  Future<Database> initDb() async {
    Timber.i("LocalDataSource.initDb()");
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

    return await openDatabase(path, version: 1);
  }
}