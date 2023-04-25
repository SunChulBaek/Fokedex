import 'package:bloc/bloc.dart';
import 'package:flutter_template/bloc/model/ui_state.dart';
import 'package:flutter_template/data/model/pokemon.dart';
import 'package:flutter_template/data/repository.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_pokemon_list_cubit.freezed.dart';

@freezed
@injectable
class PokemonListData with _$PokemonListData {
  factory PokemonListData({
    required List<Pokemon> pokemonList
  }) = _PokemonListData;

  @factoryMethod
  factory PokemonListData.from() => PokemonListData(pokemonList: List.of([]));
}

@injectable
class GetPokemonListCubit extends Cubit<UiState> {
  GetPokemonListCubit(this._repository, UiState state) : super(state);

  final Repository _repository;

  void init() async {
    try {
      final pokemonList = await _repository.getPokemonList();
      return emit(Success(
        data: PokemonListData(
          pokemonList: pokemonList.results
        )
      ));
    } catch (e) {
      Timber.e(e);
      emit(Error());
    }
  }
}