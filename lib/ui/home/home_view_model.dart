import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../model/ui_state.dart';
import '../../data/pokemon_repository.dart';
import '../../model/pokemon.dart';
import '../../util/timber.dart';

part 'home_view_model.freezed.dart';

@freezed
@injectable
class PokemonListData with _$PokemonListData {
  factory PokemonListData({
    required List<Pokemon> pokemonList,
    required int? nextKey,
  }) = _PokemonListData;

  @factoryMethod
  factory PokemonListData.from() => PokemonListData(
    pokemonList: List.of([]),
    nextKey: null
  );
}

class HomeViewModel with ChangeNotifier {
  static const pagingSize = 20;

  HomeViewModel(this._repository);

  final PokemonRepository _repository;

  List<Pokemon> list = List.empty(growable: true);

  UiState _uiState = Loading();

  UiState get uiState => _uiState;

  void load({ int? limit, int? offset, String? search }) async {
    try {
      final pokemonList = await _repository.getPokemonList(
        limit: limit, offset: offset, search: search);
      _uiState = Success(
        data: PokemonListData(
          pokemonList: pokemonList,
          nextKey: pokemonList.length < pagingSize ? null : (offset ?? 0) + pagingSize
        ),
      );
      notifyListeners();
    } catch (e) {
      Timber.e(e);
      _uiState = Error();
      notifyListeners();
    }
  }
}