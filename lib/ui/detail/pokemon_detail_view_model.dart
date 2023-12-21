import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../model/ui_chain_entry.dart';
import '../model/ui_pokemon_detail_item.dart';
import '../model/ui_state.dart';
import '../../data/pokemon_repository.dart';
import '../../model/pokemon_detail.dart';
import '../../model/species.dart';
import '../../model/type.dart';
import '../../util/converter.dart';
import '../../util/timber.dart';

part 'pokemon_detail_view_model.freezed.dart';

@freezed
class UiPokemonDetailData with _$UiPokemonDetailData {
  factory UiPokemonDetailData ({
    required PokemonDetail? pokemon,
    required List<UiPokemonDetailItem> items,
  }) = _UiPokemonDetailData;
}

@injectable
class PokemonDetailViewModel with ChangeNotifier {
  static const int _dummyId = 0;
  static const int _indexName = 1;
  static const int _indexStat = 2;
  static const int _indexFlavorText = 3;
  static const int _indexEvolutionChain = 4;

  PokemonDetailViewModel(this._repository);

  final PokemonRepository _repository;

  PokemonDetail detail = PokemonDetail();

  final List<UiPokemonDetailItem> items = List.of([]);

  UiState _uiState = Loading();

  UiState get uiState => _uiState;

  void init(int id, String name) async {
    try {
      // api 호출 전
      prepare(pId: id, name: name, onUpdate: simpleUpdate);

      // 상세
      await getDetail(id, detail, simpleUpdate);

      // Species
      final species = await getSpecies(detail, setLocalizedName);

      // Form
      final fId = detail.formId;
      if (fId != null) {
        await getForm(fId, detail, setLocalizedForm);
      }

      // Type
      await getType(detail, setLocalizedType);

      // Evolution Chain
      await getEvolutionChain(species.ecId ?? _dummyId, detail, setEvolutionChain);
    } catch (e) {
      Timber.e(e);
      if (!_isDisposed) {
        _uiState = Error();
        notifyListeners();
      }
    }
  }

  void simpleUpdate(
    PokemonDetail pokemon,
    List<UiPokemonDetailItem> items
  ) {
    detail = pokemon;
    this.items.addAll(items);
    if (!_isDisposed) {
      _uiState = Success(data: UiPokemonDetailData(
        pokemon: detail,
        items: this.items
      ));
      notifyListeners();
    }
  }

  void setLocalizedName(
    String localizedName,
    PokemonDetail pokemon,
    List<UiPokemonDetailItem> items
  ) {
    // 디폴트 이름에서 번역된 이름으로 교체
    final prevItem = this.items.removeAt(_indexName) as UiPokemonDetailName;
    this.items.insert(_indexName, UiPokemonDetailName(
      id: prevItem.id,
      defaultName: pokemon.name!,
      name: localizedName
    ));
    simpleUpdate(pokemon, items);
  }

  void setLocalizedForm(
    PokemonDetail pokemon,
    String form
  ) {
    final prevItem = items.removeAt(_indexName);
    items.insert(_indexName, UiPokemonDetailName(
      id: pokemon.id!,
      defaultName: pokemon.name!,
      name: (prevItem as UiPokemonDetailName).name,
      form: form
    ));
    simpleUpdate(pokemon, List.empty());
  }

  void setLocalizedType(
    PokemonDetail pokemon,
    int typeId,
    String typeName
  ) {
    final prevItem = items.removeAt(_indexStat);
    items.insert(_indexStat, UiPokemonDetailStat(
      weight: (prevItem as UiPokemonDetailStat).weight,
      height: (prevItem).height,
      types: List.from((prevItem).types)
        ..remove(prevItem.types.firstWhere((e) => e.id == typeId))
        ..add(Type(id: typeId, name: typeName))
    ));
    simpleUpdate(pokemon, List.empty());
  }

  void setEvolutionChain(
    PokemonDetail pokemon,
    List<List<UiChainEntry>> chains
  ) {
    if (maxEvolutionChainLength(chains) > 1) {
      items.insert(_indexEvolutionChain, UiPokemonDetailEvolutionChains(
        pId: pokemon.id!,
        chains: chains
      ));
    }
    simpleUpdate(pokemon, List.empty());
  }

  // api 호출 전
  void prepare({
    required int pId,
    required String name,
    required void Function(
      PokemonDetail pokemon,
      List<UiPokemonDetailItem> items
    ) onUpdate
  }) async {
    final pokemon = PokemonDetail(id: pId, name: name);
    final List<UiPokemonDetailItem> items = List.of([]);
    items.add(UiPokemonDetailImage(id: pId));
    items.add(UiPokemonDetailName(id: pId, defaultName: name));
    onUpdate(pokemon, items);
  }

  // 상세
  Future<void> getDetail(
    int pId,
    PokemonDetail detail,
    void Function(
      PokemonDetail pokemon,
      List<UiPokemonDetailItem> items
    ) onUpdate
  ) async {
    Timber.i("PokemonDetailViewModel.getDetail($pId)");
    final List<UiPokemonDetailItem> items = List.of([]);

    final pokemon = await _repository.getPokemon(id: pId);
    final newDetail = detail.copyWith(
      speciesId: pokemon.speciesId,
      weight: pokemon.weight,
      height: pokemon.height,
      formId: pokemon.formId,
      types: pokemon.totalTypeIds?.map((e) => Type(id: e, name: "")).toList(),
      totalTypeIds: pokemon.totalTypeIds,
    );
    items.add(UiPokemonDetailStat(
      weight: pokemon.weight ?? 0,
      height: pokemon.height ?? 0,
      types: newDetail.types ?? List.empty(),
    ));
    onUpdate(newDetail, items);
    return;
  }

  // species
  Future<Species> getSpecies(
    PokemonDetail detail,
    void Function(
      String localizedName,
      PokemonDetail pokemon,
      List<UiPokemonDetailItem> items
    ) onUpdate
  ) async {
    Timber.i("PokemonDetailViewModel.getSpecies(${detail.speciesId})");
    final List<UiPokemonDetailItem> items = List.of([]);
    final species = await _repository.getSpecies(id: detail.speciesId!);
    final newDetail = detail.copyWith(
      speciesId: detail.speciesId,
      species: species
    );
    items.add(UiPokemonDetailFlavorText(
      flavorText: species.flavorText)
    );
    // Varieties 보여주기
    if ((species.vIds?.length ?? 0) > 1) {
      items.add(UiPokemonDetailVarieties(
        pId: detail.id!,
        varietyIds: species.vIds
      ));
    }
    onUpdate(species.name, newDetail, items);
    return species;
  }

  // Evolution Chain
  Future<void> getEvolutionChain(
    int ecId,
    PokemonDetail detail,
    void Function(
      PokemonDetail pokemon,
      List<List<UiChainEntry>> chains
    ) onUpdate
  ) async {
    Timber.i("PokemonDetailViewModel.getEvolutionChain($ecId)");
    final evolutionChain = await _repository.getEvolutionChain(id: ecId);
    final newDetail = detail.copyWith(
      evolutionChainId: ecId,
      evolutionChain: evolutionChain
    );
    onUpdate(newDetail, evolutionChain.chains);
    return;
  }

  // Form
  Future<void> getForm(
    int fId,
    PokemonDetail detail,
    void Function(
      PokemonDetail pokemon,
      String form
    ) onUpdate
  ) async {
    Timber.i("PokemonDetailViewModel.getForm($fId)");
    final form = await _repository.getForm(id: fId);
    final newDetail = detail.copyWith(
      formId: fId,
      form: form
    );
    onUpdate(newDetail, form.name);
    return;
  }

  // Type
  Future<void> getType(
    PokemonDetail detail,
    void Function(
      PokemonDetail pokemon,
      int typeId,
      String typeName
    ) onUpdate
  ) async {
    Timber.i("PokemonDetailViewModel.getType(${detail.types})");
    final newTypes = List<Type>.from(detail.types ?? List.empty());
    for (var tId in detail.totalTypeIds ?? List.empty()) {
      final type = await _repository.getType(id: tId);
      newTypes
        ..remove(detail.types?.firstWhere((e) => e.id == type.id))
        ..add(type);
      final newDetail = detail.copyWith(
        totalTypeIds: detail.types?.map((e) => e.id).toList(),
        types: newTypes
      );
      onUpdate(newDetail, type.id, type.name);
    }
    return;
  }

  bool _isDisposed = false;
  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
  }
}