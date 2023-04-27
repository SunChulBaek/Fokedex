
import 'package:bloc/bloc.dart';
import 'package:flutter_template/data/repository.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:flutter_template/bloc/model/ui_state.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'get_pokemon_cubit.freezed.dart';

@freezed
@injectable
class PokemonData with _$PokemonData {
  factory PokemonData({
    required int number
  }) = _PokemonData;

  @factoryMethod
  factory PokemonData.from() => PokemonData(number: 0);
}

@injectable
class GetPokemonCubit extends Cubit<UiState> {
  GetPokemonCubit(this._repository, UiState state) : super(state);

  final Repository _repository;

  void init(int id) async {
    try {
      final pokemon = await _repository.getPokemon(id: id);
    } catch (e) {
      Timber.e(e);
    }
  }
}