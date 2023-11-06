import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../model/ui_pokemon.dart';
import '../model/ui_state.dart';
import '../../data/repository.dart';
import '../../util/timber.dart';

part 'home_view_model.freezed.dart';

@freezed
@injectable
class PokemonListData with _$PokemonListData {
  factory PokemonListData({
    required List<UiPokemon> pokemonList
  }) = _PokemonListData;

  @factoryMethod
  factory PokemonListData.from() => PokemonListData(pokemonList: List.of([]));
}

class HomeViewModel with ChangeNotifier {
  HomeViewModel(this._repository);

  final Repository _repository;

  List<UiPokemon> list = List.empty(growable: true);

  UiState _uiState = Loading();

  UiState get uiState => _uiState;

  void init({ int limit = 60, int offset = 0 }) async {
    try {
      final pokemonList = await _repository.getPokemonList(limit: limit, offset: offset);
      list.addAll(pokemonList.results.map((e) =>
          UiPokemon.from(e)
      ).where((e) =>
      !list.map((x) => x.id).contains(e.id)
      ));
      _uiState = Success(
          data: PokemonListData(pokemonList: list.toList())
      );
      notifyListeners();
    } catch (e) {
      Timber.e(e);
      _uiState = Error();
      notifyListeners();
    }
  }
}