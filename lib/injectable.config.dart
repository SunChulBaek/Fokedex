// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i7;
import 'package:event_bus/event_bus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:sqflite/sqflite.dart' as _i3;

import 'data/pokemon_data_source.dart' as _i14;
import 'data/pokemon_repository.dart' as _i16;
import 'data/rest_client.dart' as _i15;
import 'database/dao/evolution_chain_dao.dart' as _i5;
import 'database/dao/form_dao.dart' as _i6;
import 'database/dao/pokemon_dao.dart' as _i8;
import 'database/dao/pokemon_item_dao.dart' as _i9;
import 'database/dao/species_dao.dart' as _i11;
import 'database/dao/type_dao.dart' as _i12;
import 'di/app_module.dart' as _i19;
import 'di/dao_module.dart' as _i20;
import 'di/data_module.dart' as _i22;
import 'di/database_module.dart' as _i18;
import 'di/network_module.dart' as _i21;
import 'ui/detail/pokemon_detail_view_model.dart' as _i17;
import 'ui/home/home_view_model.dart' as _i10;
import 'ui/model/ui_state.dart' as _i13;

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
  final appModule = _$AppModule();
  final daoModule = _$DaoModule();
  final networkModule = _$NetworkModule();
  final dataModule = _$DataModule();
  await gh.factoryAsync<_i3.Database>(
    () => databaseModule.database,
    preResolve: true,
  );
  gh.singleton<_i4.EventBus>(appModule.eventBus);
  gh.factory<_i5.EvolutionChainDao>(() => daoModule.ecDao(gh<_i3.Database>()));
  gh.factory<_i6.FormDao>(() => daoModule.formDao(gh<_i3.Database>()));
  gh.factory<_i7.Interceptor>(
    () => networkModule.logger,
    instanceName: 'logger',
  );
  gh.factory<Map<String, dynamic>>(() => networkModule.headers);
  gh.factory<_i8.PokemonDao>(() => daoModule.pokemonDao(gh<_i3.Database>()));
  gh.factory<_i9.PokemonItemDao>(
      () => daoModule.pokemonItemDao(gh<_i3.Database>()));
  gh.factory<_i10.PokemonListData>(() => _i10.PokemonListData.from());
  gh.factory<_i11.SpeciesDao>(() => daoModule.speciesDao(gh<_i3.Database>()));
  gh.factory<_i12.TypeDao>(() => daoModule.typeDao(gh<_i3.Database>()));
  gh.factory<_i13.UiState>(() => _i13.UiState.from());
  gh.factory<_i7.BaseOptions>(
      () => networkModule.options(gh<Map<String, dynamic>>()));
  gh.factory<_i7.Dio>(() => networkModule.dio(
        gh<_i7.BaseOptions>(),
        gh<_i7.Interceptor>(instanceName: 'logger'),
      ));
  gh.factory<_i14.PokemonDataSource>(
    () => dataModule.local(
      gh<_i5.EvolutionChainDao>(),
      gh<_i6.FormDao>(),
      gh<_i8.PokemonDao>(),
      gh<_i9.PokemonItemDao>(),
      gh<_i11.SpeciesDao>(),
      gh<_i12.TypeDao>(),
    ),
    instanceName: 'local',
  );
  gh.singleton<_i15.RestClient>(_i15.RestClient.from(gh<_i7.Dio>()));
  gh.factory<_i14.PokemonDataSource>(
    () => dataModule.remote(gh<_i15.RestClient>()),
    instanceName: 'remote',
  );
  gh.singleton<_i16.PokemonRepository>(dataModule.repository(
    gh<_i14.PokemonDataSource>(instanceName: 'remote'),
    gh<_i14.PokemonDataSource>(instanceName: 'local'),
  ));
  gh.factory<_i17.PokemonDetailViewModel>(
      () => _i17.PokemonDetailViewModel(gh<_i16.PokemonRepository>()));
  return getIt;
}

class _$DatabaseModule extends _i18.DatabaseModule {}

class _$AppModule extends _i19.AppModule {}

class _$DaoModule extends _i20.DaoModule {}

class _$NetworkModule extends _i21.NetworkModule {}

class _$DataModule extends _i22.DataModule {}
