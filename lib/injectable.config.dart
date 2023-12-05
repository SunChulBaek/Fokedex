// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:event_bus/event_bus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i8;

import 'data/pokemon_data_source.dart' as _i5;
import 'data/pokemon_local_data_source.dart' as _i6;
import 'data/pokemon_remote_data_source.dart' as _i11;
import 'data/pokemon_repository.dart' as _i12;
import 'data/rest_client.dart' as _i9;
import 'di/api_module.dart' as _i14;
import 'di/app_module.dart' as _i15;
import 'ui/detail/pokemon_detail_view_model.dart' as _i13;
import 'ui/home/home_view_model.dart' as _i7;
import 'ui/model/ui_state.dart' as _i10;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final apiModule = _$ApiModule();
  final appModule = _$AppModule();
  gh.factory<_i3.BaseOptions>(() => apiModule.options);
  gh.factory<_i3.Dio>(() => apiModule.dio);
  gh.singleton<_i4.EventBus>(appModule.eventBus);
  gh.factory<Map<String, dynamic>>(() => apiModule.headers);
  gh.factory<_i5.PokemonDataSource>(
    () => _i6.PokemonLocalDataSource(),
    instanceName: 'local',
  );
  gh.factory<_i7.PokemonListData>(() => _i7.PokemonListData.from());
  gh.factory<_i8.PrettyDioLogger>(() => apiModule.logger);
  gh.singleton<_i9.RestClient>(_i9.RestClient.from(gh<_i3.Dio>()));
  gh.factory<_i10.UiState>(() => _i10.UiState.from());
  gh.factory<_i5.PokemonDataSource>(
    () => _i11.PokemonRemoteDataSource(gh<_i9.RestClient>()),
    instanceName: 'remote',
  );
  gh.factory<_i12.PokemonRepository>(() => _i12.PokemonRepository(
        gh<_i5.PokemonDataSource>(instanceName: 'remote'),
        gh<_i5.PokemonDataSource>(instanceName: 'local'),
      ));
  gh.factory<_i13.PokemonDetailViewModel>(
      () => _i13.PokemonDetailViewModel(gh<_i12.PokemonRepository>()));
  return getIt;
}

class _$ApiModule extends _i14.ApiModule {}

class _$AppModule extends _i15.AppModule {}
