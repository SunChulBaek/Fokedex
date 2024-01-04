// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/pokemon_data_source.dart' as _i13;
import 'data/pokemon_repository.dart' as _i15;
import 'data/rest_client.dart' as _i14;
import 'database/dao/evolution_chain_dao.dart' as _i12;
import 'database/dao/form_dao.dart' as _i4;
import 'database/dao/pokemon_dao.dart' as _i6;
import 'database/dao/pokemon_item_dao.dart' as _i7;
import 'database/dao/species_dao.dart' as _i9;
import 'database/dao/type_dao.dart' as _i10;
import 'database/fokedex_database.dart' as _i3;
import 'di/data_module.dart' as _i18;
import 'di/database_module.dart' as _i17;
import 'ui/detail/pokemon_detail_view_model.dart' as _i16;
import 'ui/home/home_view_model.dart' as _i8;
import 'ui/model/ui_state.dart' as _i11;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final databaseModule = _$DatabaseModule();
  final dataModule = _$DataModule();
  await gh.factoryAsync<_i3.FokedexDatabase>(
    () => databaseModule.database,
    preResolve: true,
  );
  gh.factory<_i4.FormDao>(
      () => databaseModule.formDao(gh<_i3.FokedexDatabase>()));
  gh.factory<_i5.Interceptor>(
    () => dataModule.logger,
    instanceName: 'logger',
  );
  gh.factory<Map<String, dynamic>>(() => dataModule.headers);
  gh.factory<_i6.PokemonDao>(
      () => databaseModule.pokemonDao(gh<_i3.FokedexDatabase>()));
  gh.factory<_i7.PokemonItemDao>(
      () => databaseModule.pokemonItemDao(gh<_i3.FokedexDatabase>()));
  gh.factory<_i8.PokemonListData>(() => _i8.PokemonListData.from());
  gh.factory<_i9.SpeciesDao>(
      () => databaseModule.speciesDao(gh<_i3.FokedexDatabase>()));
  gh.factory<_i10.TypeDao>(
      () => databaseModule.typeDao(gh<_i3.FokedexDatabase>()));
  gh.factory<_i11.UiState>(() => _i11.UiState.from());
  gh.factory<_i5.BaseOptions>(
      () => dataModule.options(gh<Map<String, dynamic>>()));
  gh.factory<_i5.Dio>(() => dataModule.dio(
        gh<_i5.BaseOptions>(),
        gh<_i5.Interceptor>(instanceName: 'logger'),
      ));
  gh.factory<_i12.EvolutionChainDao>(
      () => databaseModule.ecDao(gh<_i3.FokedexDatabase>()));
  gh.factory<_i13.PokemonDataSource>(
    () => dataModule.local(
      gh<_i12.EvolutionChainDao>(),
      gh<_i4.FormDao>(),
      gh<_i6.PokemonDao>(),
      gh<_i7.PokemonItemDao>(),
      gh<_i9.SpeciesDao>(),
      gh<_i10.TypeDao>(),
    ),
    instanceName: 'local',
  );
  gh.singleton<_i14.RestClient>(_i14.RestClient.from(gh<_i5.Dio>()));
  gh.factory<_i13.PokemonDataSource>(
    () => dataModule.remote(gh<_i14.RestClient>()),
    instanceName: 'remote',
  );
  gh.singleton<_i15.PokemonRepository>(dataModule.repository(
    gh<_i13.PokemonDataSource>(instanceName: 'remote'),
    gh<_i13.PokemonDataSource>(instanceName: 'local'),
  ));
  gh.factory<_i16.PokemonDetailViewModel>(
      () => _i16.PokemonDetailViewModel(gh<_i15.PokemonRepository>()));
  return getIt;
}

class _$DatabaseModule extends _i17.DatabaseModule {}

class _$DataModule extends _i18.DataModule {}
