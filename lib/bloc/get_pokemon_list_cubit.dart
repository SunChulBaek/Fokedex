import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../data/repository.dart';
import '../ui/model/ui_pokemon.dart';
import '../util/timber.dart';
import 'model/ui_state.dart';

part 'get_pokemon_list_cubit.freezed.dart';

@freezed
@injectable
class PokemonListData with _$PokemonListData {
  factory PokemonListData({
    required List<UiPokemon> pokemonList
  }) = _PokemonListData;

  @factoryMethod
  factory PokemonListData.from() => PokemonListData(pokemonList: List.of([]));
}

@injectable
class GetPokemonListCubit extends Cubit<UiState> {
  GetPokemonListCubit(this._repository, UiState state) : super(state);

  final Repository _repository;

  List<UiPokemon> list = List.empty(growable: true);

  void init({ int limit = 20, int offset = 0 }) async {
    try {
      final pokemonList = await _repository.getPokemonList(limit: limit, offset: offset);
      list.addAll(pokemonList.results.map((e) =>
          UiPokemon.from(e)
      ).where((e) =>
          !list.map((x) => x.id).contains(e.id)
      ));
      return emit(Success(
        data: PokemonListData(pokemonList: list.toList())
      ));
    } catch (e) {
      Timber.e(e);
      emit(Error());
    }
  }
}