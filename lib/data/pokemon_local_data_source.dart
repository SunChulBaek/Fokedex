import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import 'pokemon_data_source.dart';
import 'type_converter.dart';
import 'model/network_named_api_resource.dart';
import 'model/network_named_api_resource_list.dart';
import 'model/network_pokemon.dart';
import '../database/model/form_entity.dart';
import '../database/model/species_entity.dart';
import '../database/model/type_entity.dart';
import '../model/evolution_chain.dart';
import '../ui/model/ui_chain_entry.dart';
import '../util/timber.dart';

@Named("local")
@Injectable(as: PokemonDataSource)
class PokemonLocalDataSource implements PokemonDataSource {
  static const dbName = "cokedex-database.db";

  Database? _db;

  @override
  Future<NetworkNamedAPIResourceList> getPokemonList({
    int limit = 20,
    int offset = 0
  }) async {
    final db = await getDb();
    final pokemonList = await db.query("pokemon_item");
    Timber.i("LocalDataSource.getPokemonList(${pokemonList.length})");
    return NetworkNamedAPIResourceList(
      pokemonList.length,
      null,
      null,
      pokemonList.map((e) {
        return NetworkNamedAPIResource(
          name: e["name"].toString(),
          url: "https://pokeapi.co/api/v2/pokemon/${e["id"].toString()}/"
        );
      }).toList()
    );
  }

  @override
  Future<FormEntity?> getForm({
    required int id
  }) async {
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
    Timber.i("Local.saveForm()");
    final db = await getDb();
    await db.insert("form", {
      "f_id": form.id,
      "names": TypeConverter.namesToString2(form.names)
    });
  }

  @override
  Future<NetworkPokemon> getPokemon({
    required int id
  }) {
    // TODO: implement getPokemon
    throw UnimplementedError();
  }

  @override
  Future<SpeciesEntity?> getSpecies({
    required int id
  }) async {
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
    final db = await getDb();
    await db.insert("type", {
      "t_id": type.id,
      "names": TypeConverter.namesToString2(type.names)
    });
  }

  @override
  Future<EvolutionChain?> getEvolutionChain({
    required int id
  }) async {
    Timber.i("PokemonLocalDataSource.getEvolutionChain($id)");
    final db = await getDb();
    final chains = await db.query("evolution_chain",
      where: "c_id = ?",
      whereArgs: [id]
    );
    if (chains.isNotEmpty) {
      return EvolutionChain(
        id: id,
        chains: chains.where((e) => e["is_leaf"] == 1).map((leaf) {
          final list = List<UiChainEntry>.of([]);
          UiChainEntry? entry = UiChainEntry(
            pId: leaf["p_id"] as int,
            prevId: (leaf["prev_id"] as int?) ?? 0,
            trigger: leaf["trigger"] as String,
            isLeaf: (leaf["is_leaf"] as int) == 1 ? true : false
          );
          while (entry != null) {
            list.add(entry);
            entry = chains.where((e) => e["p_id"] == entry?.prevId).map((e) =>
              UiChainEntry(
                pId: e["p_id"] as int,
                prevId: (e["prev_id"] as int?) ?? 0,
                trigger: e["trigger"] as String,
                isLeaf: (e["is_leaf"] as int) == 1 ? true : false
              )
            ).firstOrNull;
          }
          return list;
        }).toList(),
        fromDB: true
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> saveEvolutionChain({required EvolutionChain chain}) async {
    Timber.i("PokemonLocalDataSource.saveEvolutionChain()");
    final db = await getDb();
    for (var i in chain.chains) {
      for (var element in i) {
        await db.insert("evolution_chain", {
          "c_id": chain.id,
          "p_id": element.pId,
          "trigger": element.trigger,
          "prev_id": element.prevId,
          "is_leaf": element.isLeaf ? 1 : 0
        });
      }
    }
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