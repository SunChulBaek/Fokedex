import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import 'pokemon_data_source.dart';
import 'model/network_evolution_chain.dart';
import 'model/network_name.dart';
import 'model/network_named_api_resource.dart';
import 'model/network_named_api_resource_list.dart';
import 'model/network_pokemon.dart';
import 'model/network_pokemon_form.dart';
import 'model/network_pokemon_species.dart';
import 'model/network_type.dart';
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
  Future<NetworkEvolutionChain> getEvolutionChain({
    required int id
  }) {
    // TODO: implement getEvolutionChain
    throw UnimplementedError();
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
        formNames: form[0]["names"].toString().split(":").where((e) => e.isNotEmpty).map((e) =>
          NetworkName(
            name: e.split("=")[1],
            language: NetworkNamedAPIResource(
              name: e.split("=")[0],
              url: ""
            )
          )
        ).toList()
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
      "names": form.formNames.fold("", (acc, name) {
        return "$acc:${name.language.name}=${name.name}";
      })
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
  Future<NetworkPokemonSpecies> getSpecies({
    required int id
  }) {
    // TODO: implement getSpecies
    throw UnimplementedError();
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
        names: type[0]["names"].toString().split(":").where((e) => e.isNotEmpty).map((e) {
          return NetworkName(
            name: e.split("=")[1],
            language: NetworkNamedAPIResource(
              name: e.split("=")[0],
              url: ''
            )
          );
        }).toList()
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
      "names": type.names.fold("", (acc, name) {
        return "$acc:${name.language.name}=${name.name}";
      })
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