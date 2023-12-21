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
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i10;

import 'data/pokemon_data_source.dart' as _i15;
import 'data/pokemon_local_data_source.dart' as _i17;
import 'data/pokemon_remote_data_source.dart' as _i16;
import 'data/pokemon_repository.dart' as _i18;
import 'data/rest_client.dart' as _i11;
import 'database/dao/evolution_chain_dao.dart' as _i5;
import 'database/dao/form_dao.dart' as _i6;
import 'database/dao/pokemon_dao.dart' as _i7;
import 'database/dao/pokemon_item_dao.dart' as _i8;
import 'database/dao/species_dao.dart' as _i12;
import 'database/dao/type_dao.dart' as _i13;
import 'di/api_module.dart' as _i20;
import 'di/app_module.dart' as _i21;
import 'ui/detail/pokemon_detail_view_model.dart' as _i19;
import 'ui/home/home_view_model.dart' as _i9;
import 'ui/model/ui_state.dart' as _i14;

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
  gh.factory<_i5.EvolutionChainDao>(() => _i5.EvolutionChainDao());
  gh.factory<_i6.FormDao>(() => _i6.FormDao());
  gh.factory<Map<String, dynamic>>(() => apiModule.headers);
  gh.factory<_i7.PokemonDao>(() => _i7.PokemonDao());
  gh.factory<_i8.PokemonItemDao>(() => _i8.PokemonItemDao());
  gh.factory<_i9.PokemonListData>(() => _i9.PokemonListData.from());
  gh.factory<_i10.PrettyDioLogger>(() => apiModule.logger);
  gh.singleton<_i11.RestClient>(_i11.RestClient.from(gh<_i3.Dio>()));
  gh.factory<_i12.SpeciesDao>(() => _i12.SpeciesDao());
  gh.factory<_i13.TypeDao>(() => _i13.TypeDao());
  gh.factory<_i14.UiState>(() => _i14.UiState.from());
  gh.factory<_i15.PokemonDataSource>(
    () => _i16.PokemonRemoteDataSource(gh<_i11.RestClient>()),
    instanceName: 'remote',
  );
  gh.factory<_i15.PokemonDataSource>(
    () => _i17.PokemonLocalDataSource(
      gh<_i5.EvolutionChainDao>(),
      gh<_i6.FormDao>(),
      gh<_i7.PokemonDao>(),
      gh<_i8.PokemonItemDao>(),
      gh<_i12.SpeciesDao>(),
      gh<_i13.TypeDao>(),
    ),
    instanceName: 'local',
  );
  gh.factory<_i18.PokemonRepository>(() => _i18.PokemonRepository(
        gh<_i15.PokemonDataSource>(instanceName: 'remote'),
        gh<_i15.PokemonDataSource>(instanceName: 'local'),
      ));
  gh.factory<_i19.PokemonDetailViewModel>(
      () => _i19.PokemonDetailViewModel(gh<_i18.PokemonRepository>()));
  return getIt;
}

class _$ApiModule extends _i20.ApiModule {}

class _$AppModule extends _i21.AppModule {}
