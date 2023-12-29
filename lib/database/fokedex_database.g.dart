// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fokedex_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFokedexDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FokedexDatabaseBuilder databaseBuilder(String name) =>
      _$FokedexDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FokedexDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FokedexDatabaseBuilder(null);
}

class _$FokedexDatabaseBuilder {
  _$FokedexDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FokedexDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FokedexDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FokedexDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FokedexDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FokedexDatabase extends FokedexDatabase {
  _$FokedexDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  EvolutionChainDao? _evolutionChainDaoInstance;

  FormDao? _formDaoInstance;

  PokemonDao? _pokemonDaoInstance;

  PokemonItemDao? _pokemonItemDaoInstance;

  SpeciesDao? _speciesDaoInstance;

  TypeDao? _typeDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `evolution_chain` (`c_id` INTEGER NOT NULL, `p_id` INTEGER NOT NULL, `trigger` TEXT NOT NULL, `prev_id` INTEGER, `is_leaf` INTEGER NOT NULL, PRIMARY KEY (`c_id`, `p_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `form` (`f_id` INTEGER NOT NULL, `names` TEXT NOT NULL, PRIMARY KEY (`f_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `pokemon` (`p_id` INTEGER NOT NULL, `s_id` INTEGER NOT NULL, `f_id` INTEGER NOT NULL, `name` TEXT NOT NULL, `base_experience` INTEGER NOT NULL, `height` INTEGER NOT NULL, `is_default` INTEGER NOT NULL, `order` INTEGER NOT NULL, `weight` INTEGER NOT NULL, `typeIds` TEXT NOT NULL, PRIMARY KEY (`p_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `pokemon_item` (`id` INTEGER NOT NULL, `indexx` INTEGER NOT NULL, `name` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `species` (`s_id` INTEGER NOT NULL, `names` TEXT NOT NULL, `flavor_texts` TEXT NOT NULL, `ec_id` INTEGER, `v_ids` TEXT, PRIMARY KEY (`s_id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `type` (`t_id` INTEGER NOT NULL, `names` TEXT NOT NULL, PRIMARY KEY (`t_id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  EvolutionChainDao get evolutionChainDao {
    return _evolutionChainDaoInstance ??=
        _$EvolutionChainDao(database, changeListener);
  }

  @override
  FormDao get formDao {
    return _formDaoInstance ??= _$FormDao(database, changeListener);
  }

  @override
  PokemonDao get pokemonDao {
    return _pokemonDaoInstance ??= _$PokemonDao(database, changeListener);
  }

  @override
  PokemonItemDao get pokemonItemDao {
    return _pokemonItemDaoInstance ??=
        _$PokemonItemDao(database, changeListener);
  }

  @override
  SpeciesDao get speciesDao {
    return _speciesDaoInstance ??= _$SpeciesDao(database, changeListener);
  }

  @override
  TypeDao get typeDao {
    return _typeDaoInstance ??= _$TypeDao(database, changeListener);
  }
}

class _$EvolutionChainDao extends EvolutionChainDao {
  _$EvolutionChainDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _evolutionChainEntityInsertionAdapter = InsertionAdapter(
            database,
            'evolution_chain',
            (EvolutionChainEntity item) => <String, Object?>{
                  'c_id': item.cId,
                  'p_id': item.pId,
                  'trigger': item.trigger,
                  'prev_id': item.prevId,
                  'is_leaf': item.isLeaf ? 1 : 0
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<EvolutionChainEntity>
      _evolutionChainEntityInsertionAdapter;

  @override
  Future<List<EvolutionChainEntity>> findById(int id) async {
    return _queryAdapter.queryList(
        'SELECT * FROM evolution_chain WHERE c_id = ?1',
        mapper: (Map<String, Object?> row) => EvolutionChainEntity(
            cId: row['c_id'] as int,
            pId: row['p_id'] as int,
            trigger: row['trigger'] as String,
            prevId: row['prev_id'] as int?,
            isLeaf: (row['is_leaf'] as int) != 0),
        arguments: [id]);
  }

  @override
  Future<void> insertEvolutionChain(EvolutionChainEntity chain) async {
    await _evolutionChainEntityInsertionAdapter.insert(
        chain, OnConflictStrategy.ignore);
  }
}

class _$FormDao extends FormDao {
  _$FormDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _formEntityInsertionAdapter = InsertionAdapter(
            database,
            'form',
            (FormEntity item) => <String, Object?>{
                  'f_id': item.id,
                  'names': _langValueConverter.encode(item.names)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FormEntity> _formEntityInsertionAdapter;

  @override
  Future<FormEntity?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM form WHERE f_id = ?1',
        mapper: (Map<String, Object?> row) => FormEntity(
            id: row['f_id'] as int,
            names: _langValueConverter.decode(row['names'] as String)),
        arguments: [id]);
  }

  @override
  Future<void> insertForm(FormEntity form) async {
    await _formEntityInsertionAdapter.insert(form, OnConflictStrategy.ignore);
  }
}

class _$PokemonDao extends PokemonDao {
  _$PokemonDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _pokemonEntityInsertionAdapter = InsertionAdapter(
            database,
            'pokemon',
            (PokemonEntity item) => <String, Object?>{
                  'p_id': item.id,
                  's_id': item.sId,
                  'f_id': item.fId,
                  'name': item.name,
                  'base_experience': item.baseExp,
                  'height': item.height,
                  'is_default': item.isDefault ? 1 : 0,
                  'order': item.order,
                  'weight': item.weight,
                  'typeIds': _idsConverter.encode(item.typeIds)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PokemonEntity> _pokemonEntityInsertionAdapter;

  @override
  Future<PokemonEntity?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM pokemon WHERE p_id = ?1',
        mapper: (Map<String, Object?> row) => PokemonEntity(
            id: row['p_id'] as int,
            sId: row['s_id'] as int,
            fId: row['f_id'] as int,
            name: row['name'] as String,
            baseExp: row['base_experience'] as int,
            height: row['height'] as int,
            isDefault: (row['is_default'] as int) != 0,
            order: row['order'] as int,
            weight: row['weight'] as int,
            typeIds: _idsConverter.decode(row['typeIds'] as String)),
        arguments: [id]);
  }

  @override
  Future<void> insertPokemon(PokemonEntity pokemon) async {
    await _pokemonEntityInsertionAdapter.insert(
        pokemon, OnConflictStrategy.ignore);
  }
}

class _$PokemonItemDao extends PokemonItemDao {
  _$PokemonItemDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _pokemonItemEntityInsertionAdapter = InsertionAdapter(
            database,
            'pokemon_item',
            (PokemonItemEntity item) => <String, Object?>{
                  'id': item.id,
                  'indexx': item.index,
                  'name': item.name
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PokemonItemEntity> _pokemonItemEntityInsertionAdapter;

  @override
  Future<List<PokemonItemEntity>> selectAll() async {
    return _queryAdapter.queryList('SELECT * FROM pokemon_item',
        mapper: (Map<String, Object?> row) => PokemonItemEntity(
            id: row['id'] as int,
            index: row['indexx'] as int,
            name: row['name'] as String));
  }

  @override
  Future<List<PokemonItemEntity>> findByIndex(List<int> indexx) async {
    const offset = 1;
    final _sqliteVariablesForIndexx =
        Iterable<String>.generate(indexx.length, (i) => '?${i + offset}')
            .join(',');
    return _queryAdapter.queryList(
        'SELECT * FROM pokemon_item WHERE indexx in (' +
            _sqliteVariablesForIndexx +
            ')',
        mapper: (Map<String, Object?> row) => PokemonItemEntity(
            id: row['id'] as int,
            index: row['indexx'] as int,
            name: row['name'] as String),
        arguments: [...indexx]);
  }

  @override
  Future<void> insertPokemonItem(List<PokemonItemEntity> pokemonList) async {
    await _pokemonItemEntityInsertionAdapter.insertList(
        pokemonList, OnConflictStrategy.ignore);
  }
}

class _$SpeciesDao extends SpeciesDao {
  _$SpeciesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _speciesEntityInsertionAdapter = InsertionAdapter(
            database,
            'species',
            (SpeciesEntity item) => <String, Object?>{
                  's_id': item.id,
                  'names': _langValueConverter.encode(item.names),
                  'flavor_texts':
                      _langValueVersionConverter.encode(item.flavorTexts),
                  'ec_id': item.ecId,
                  'v_ids': _idsConverter2.encode(item.vIds)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SpeciesEntity> _speciesEntityInsertionAdapter;

  @override
  Future<List<SpeciesEntity>> selectAll() async {
    return _queryAdapter.queryList('SELECT * FROM species',
        mapper: (Map<String, Object?> row) => SpeciesEntity(
            id: row['s_id'] as int,
            names: _langValueConverter.decode(row['names'] as String),
            flavorTexts: _langValueVersionConverter
                .decode(row['flavor_texts'] as String),
            ecId: row['ec_id'] as int?,
            vIds: _idsConverter2.decode(row['v_ids'] as String)));
  }

  @override
  Future<SpeciesEntity?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM species WHERE s_id = ?1',
        mapper: (Map<String, Object?> row) => SpeciesEntity(
            id: row['s_id'] as int,
            names: _langValueConverter.decode(row['names'] as String),
            flavorTexts: _langValueVersionConverter
                .decode(row['flavor_texts'] as String),
            ecId: row['ec_id'] as int?,
            vIds: _idsConverter2.decode(row['v_ids'] as String)),
        arguments: [id]);
  }

  @override
  Future<void> insertSpecies(SpeciesEntity species) async {
    await _speciesEntityInsertionAdapter.insert(
        species, OnConflictStrategy.ignore);
  }
}

class _$TypeDao extends TypeDao {
  _$TypeDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _typeEntityInsertionAdapter = InsertionAdapter(
            database,
            'type',
            (TypeEntity item) => <String, Object?>{
                  't_id': item.id,
                  'names': _langValueConverter.encode(item.names)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TypeEntity> _typeEntityInsertionAdapter;

  @override
  Future<TypeEntity?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM type WHERE t_id = ?1',
        mapper: (Map<String, Object?> row) => TypeEntity(
            id: row['t_id'] as int,
            names: _langValueConverter.decode(row['names'] as String)),
        arguments: [id]);
  }

  @override
  Future<void> insertType(TypeEntity type) async {
    await _typeEntityInsertionAdapter.insert(type, OnConflictStrategy.ignore);
  }
}

// ignore_for_file: unused_element
final _idsConverter = IdsConverter();
final _idsConverter2 = IdsConverter2();
final _langValueConverter = LangValueConverter();
final _langValueVersionConverter = LangValueVersionConverter();
