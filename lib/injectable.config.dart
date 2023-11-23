// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:event_bus/event_bus.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i8;

import 'data/data_source.dart' as _i4;
import 'data/local_data_source.dart' as _i5;
import 'data/repository.dart' as _i11;
import 'data/rest_client.dart' as _i10;
import 'di/api_module.dart' as _i13;
import 'di/app_module.dart' as _i14;
import 'ui/detail/pokemon_detail_view_model.dart' as _i12;
import 'ui/home/home_view_model.dart' as _i7;
import 'ui/model/ui_state.dart' as _i9;

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
  gh.factory<_i4.DataSource>(
    () => _i5.LocalDataSource(),
    instanceName: 'local',
  );
  gh.factory<_i3.Dio>(() => apiModule.dio);
  gh.singleton<_i6.EventBus>(appModule.eventBus);
  gh.factory<Map<String, dynamic>>(() => apiModule.headers);
  gh.factory<_i7.PokemonListData>(() => _i7.PokemonListData.from());
  gh.factory<_i8.PrettyDioLogger>(() => apiModule.logger);
  gh.factory<_i9.UiState>(() => _i9.UiState.from());
  gh.singleton<_i4.DataSource>(
    _i10.RestClient.from(gh<_i3.Dio>()),
    instanceName: 'remote',
  );
  gh.factory<_i11.Repository>(() => _i11.Repository(
        gh<_i4.DataSource>(instanceName: 'remote'),
        gh<_i4.DataSource>(instanceName: 'local'),
      ));
  gh.factory<_i12.PokemonDetailViewModel>(
      () => _i12.PokemonDetailViewModel(gh<_i11.Repository>()));
  return getIt;
}

class _$ApiModule extends _i13.ApiModule {}

class _$AppModule extends _i14.AppModule {}
