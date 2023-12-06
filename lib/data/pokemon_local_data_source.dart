import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import 'pokemon_data_source.dart';
import 'type_converter.dart';
import 'model/network_api_resource.dart';
import 'model/network_evolution_chain.dart';
import 'model/network_named_api_resource.dart';
import 'model/network_named_api_resource_list.dart';
import 'model/network_pokemon.dart';
import 'model/network_pokemon_form.dart';
import 'model/network_pokemon_species.dart';
import 'model/network_type.dart';
import '../util/converter.dart';
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
  Future<NetworkPokemonForm?> getForm({
    required int id
  }) async {
    final db = await getDb();
    final form = await db.query("form",
      where: "f_id = ?",
      whereArgs: [id]
    );
    if (form.isNotEmpty) {
      return NetworkPokemonForm(
        id: int.parse(form[0]["f_id"].toString()),
        formNames: TypeConverter.stringToNames(form[0]["names"].toString())
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> saveForm({required NetworkPokemonForm form}) async {
    Timber.i("Local.saveForm()");
    final db = await getDb();
    await db.insert("form", {
      "f_id": form.id,
      "names": TypeConverter.namesToString(form.formNames)
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
  Future<NetworkPokemonSpecies?> getSpecies({
    required int id
  }) async {
    final db = await getDb();
    final species = await db.query("species",
      where: "s_id = ?",
      whereArgs: [id]
    );
    if (species.isNotEmpty) {
      return NetworkPokemonSpecies(
        id: int.parse(species[0]["s_id"].toString()),
        names: TypeConverter.stringToNames(species[0]["names"].toString()),
        flavorTextEntries: TypeConverter.stringToFlavors(species[0]["flavor_texts"].toString()),
        evolutionChain: NetworkAPIResource(url: "https://pokeapi.co/api/v2/evolution-chain/${species[0]["ec_id"].toString()}/"),
        varieties: TypeConverter.stringToVarieties(species[0]["v_ids"].toString())
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> saveSpecies({required NetworkPokemonSpecies species}) async {
    final db = await getDb();
    await db.insert("species", {
      "s_id": species.id,
      "names": TypeConverter.namesToString(species.names),
      "flavor_texts": TypeConverter.flavorsToString(species.flavorTextEntries),
      "ec_id": getIdFromUrl(species.evolutionChain.url),
      "v_ids": TypeConverter.varietiesToString(species.varieties),
    });
  }

  @override
  Future<NetworkType?> getType({
    required int id
  }) async {
    final db = await getDb();
    final type = await db.query(
      "type",
      where: "t_id = ?",
      whereArgs: [id]
    );
    if (type.isNotEmpty) {
      return NetworkType(
        id: int.parse(type[0]["t_id"].toString()),
        name: "",
        names: TypeConverter.stringToNames(type[0]["names"].toString())
      );
    } else {
      return null;
    }
  }

  @override
  Future<void> saveType({required NetworkType type}) async {
    final db = await getDb();
    await db.insert("type", {
      "t_id": type.id,
      "names": TypeConverter.namesToString(type.names)
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

  @override
  Future<NetworkEvolutionChain?> getEvolutionChain({
    required int id
  }) async {
    // TODO: implement getEvolutionChain
    return null;
  }

  @override
  Future<void> saveEvolutionChain({required NetworkEvolutionChain chain}) async {
    return;
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