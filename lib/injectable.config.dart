// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:event_bus/event_bus.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i7;

import 'bloc/get_pokemon_cubit.dart' as _i5;
import 'bloc/get_pokemon_list_cubit.dart' as _i6;
import 'bloc/model/ui_state.dart' as _i9;
import 'data/repository.dart' as _i10;
import 'data/rest_client.dart' as _i8;
import 'di/api_module.dart' as _i11;
import 'di/app_module.dart' as _i12;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
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
  gh.factory<_i5.PokemonData>(() => _i5.PokemonData.from());
  gh.factory<_i6.PokemonListData>(() => _i6.PokemonListData.from());
  gh.factory<_i7.PrettyDioLogger>(() => apiModule.logger);
  gh.singleton<_i8.RestClient>(_i8.RestClient.from(gh<_i3.Dio>()));
  gh.factory<_i9.UiState>(() => _i9.UiState.from());
  gh.factory<_i10.Repository>(() => _i10.Repository(gh<_i8.RestClient>()));
  gh.factory<_i5.GetPokemonCubit>(() => _i5.GetPokemonCubit(
        gh<_i10.Repository>(),
        gh<_i9.UiState>(),
      ));
  gh.factory<_i6.GetPokemonListCubit>(() => _i6.GetPokemonListCubit(
        gh<_i10.Repository>(),
        gh<_i9.UiState>(),
      ));
  return getIt;
}

class _$ApiModule extends _i11.ApiModule {}

class _$AppModule extends _i12.AppModule {}
