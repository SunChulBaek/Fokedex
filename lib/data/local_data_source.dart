import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_template/data/data_source.dart';
import 'package:flutter_template/data/model/network_evolution_chain.dart';
import 'package:flutter_template/data/model/network_named_api_resource_list.dart';
import 'package:flutter_template/data/model/network_pokemon.dart';
import 'package:flutter_template/data/model/network_pokemon_form.dart';
import 'package:flutter_template/data/model/network_pokemon_species.dart';
import 'package:flutter_template/data/model/network_type.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

import '../util/timber.dart';
import 'model/network_named_api_resource.dart';

@Named("local")
@Injectable(as: DataSource)
class LocalDataSource implements DataSource {
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
  Future<NetworkPokemonForm> getForm({
    required int id
  }) {
    // TODO: implement getForm
    throw UnimplementedError();
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
  Future<NetworkType> getType({
    required int id
  }) {
    // TODO: implement getType
    throw UnimplementedError();
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