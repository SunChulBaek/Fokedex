import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../model/pokemon.dart';
import '../model/ui_state.dart';
import '../../data/pokemon_repository.dart';
import '../../util/timber.dart';

part 'home_view_model.freezed.dart';

@freezed
@injectable
class PokemonListData with _$PokemonListData {
  factory PokemonListData({
    required List<Pokemon> pokemonList
  }) = _PokemonListData;

  @factoryMethod
  factory PokemonListData.from() => PokemonListData(pokemonList: List.of([]));
}

class HomeViewModel with ChangeNotifier {
  HomeViewModel(this._repository);

  final PokemonRepository _repository;

  List<Pokemon> list = List.empty(growable: true);

  UiState _uiState = Loading();

  UiState get uiState => _uiState;

  void init({ int? limit, int? offset, String? search }) async {
    try {
      final pokemonList = await _repository.getPokemonList(
        limit: limit, offset: offset, search: search);
      // list.clear();
      list.addAll(pokemonList.where((e) =>
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