import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../model/ui_chain_entry.dart';
import '../model/ui_pokemon_detail_item.dart';
import '../model/ui_state.dart';
import '../../data/model/network_chain_link.dart';
import '../../data/model/network_evolution_chain.dart';
import '../../data/model/network_pokemon.dart';
import '../../data/model/network_pokemon_species.dart';
import '../../data/model/network_pokemon_type.dart';
import '../../data/pokemon_repository.dart';
import '../../model/evolution_chain.dart';
import '../../model/lang_value_version.dart';
import '../../model/species.dart';
import '../../model/pokemon_detail.dart';
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
      final pokemon = await getDetail(id, detail, simpleUpdate);

      // Species
      final species = await getSpecies(pokemon, detail, setLocalizedName);

      // Evolution Chain
      final ecId = getIdFromUrl(species.evolutionChain.url);
      await getEvolutionChain(pokemon.id, ecId, detail, setEvolutionChain);

      // Form
      final fId = getIdFromUrl(pokemon.forms.first.url);
      await getForm(pokemon.id, fId, detail, setLocalizedForm);

      // Type
      await getType(pokemon.types, detail, setLocalizedType);
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
        types: (prevItem).types
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
  Future<NetworkPokemon> getDetail(
      int pId,
      PokemonDetail detail,
      void Function(
          PokemonDetail pokemon,
          List<UiPokemonDetailItem> items
          ) onUpdate
      ) async {
    final List<Type> types = List<Type>.of([]);
    final List<UiPokemonDetailItem> items = List.of([]);

    final pokemon = await _repository.getPokemon(id: pId);
    for (var e in pokemon.types) {
      types.add(Type(id: getIdFromUrl(e.type.url), name: ""));
    }
    final newDetail = detail.copyWith(
        weight: pokemon.weight,
        height: pokemon.height,
        types: types
    );
    items.add(UiPokemonDetailStat(
        weight: pokemon.weight,
        height: pokemon.height,
        types: pokemon.types.map((e) =>
            Type(id: getIdFromUrl(e.type.url), name: e.type.name)
        ).toList()
    ));
    onUpdate(newDetail, items);
    return pokemon;
  }

  // species
  Future<NetworkPokemonSpecies> getSpecies(
      NetworkPokemon pokemon,
      PokemonDetail detail,
      void Function(
          String localizedName,
          PokemonDetail pokemon,
          List<UiPokemonDetailItem> items
          ) onUpdate
      ) async {
    final List<UiPokemonDetailItem> items = List.of([]);
    final species = await _repository.getSpecies(id: getIdFromUrl(pokemon.species.url));
    final newDetail = detail.copyWith(
      speciesId: getIdFromUrl(pokemon.species.url),
      species: Species(
        id: getIdFromUrl(pokemon.species.url),
        flavorTexts: species.flavorTextEntries.map((e) =>
          LangValueVersion(
            lang: e.language.name,
            value: e.flavorText,
            version: e.version.name
          )
        ).toList(),
        fromDB: false
      ),
    );

    items.add(UiPokemonDetailFlavorText(
        flavorText: getFlavorTextForLocale(species.flavorTextEntries))
    );
    // Varieties 보여주기
    if (species.varieties.length > 1) {
      items.add(UiPokemonDetailVarieties(
          pId: pokemon.id,
          varietyIds: species.varieties.map((e) =>
              getIdFromUrl(e.pokemon.url)).toList())
      );
    }
    onUpdate(getNameForLocale(species.names), newDetail, items);
    return species;
  }

  // Evolution Chain
  Future<void> getEvolutionChain(
      int pId,
      int ecId,
      PokemonDetail detail,
      void Function(
          PokemonDetail pokemon,
          List<List<UiChainEntry>> chains
          ) onUpdate
      ) async {
    if (ecId > 0) {
      await _repository.getEvolutionChain(id: ecId).then((evolutionChain) {
        final List<UiPokemonDetailItem> items = List.of([]);
        final chains = getChains(evolutionChain);
        final newDetail = detail.copyWith(
          evolutionChainId: ecId,
          evolutionChain: EvolutionChain(
            id: ecId,
            chains: chains,
            fromDB: false
          )
        );
        onUpdate(newDetail, chains);
      });
    }
  }

  // Form
  Future<void> getForm(
      int pId,
      int fId,
      PokemonDetail detail,
      void Function(
          PokemonDetail pokemon,
          String form
          ) onUpdate
      ) async {
    await _repository.getForm(id: fId).then((form) {
      final newDetail = detail.copyWith(
        formId: fId,
        form: form
      );
      onUpdate(newDetail, form.name);
    });
  }

  // Type
  Future<void> getType(
      List<NetworkPokemonType> types,
      PokemonDetail detail,
      void Function(
          PokemonDetail pokemon,
          int typeId,
          String typeName
          ) onUpdate
      ) async {
    final newTypes = List<Type>.from(detail.types!);
    for (var type in types) {
      _repository.getType(
          id: getIdFromUrl(type.type.url)
      ).then((type) {
        newTypes
          ..remove(detail.types?.firstWhere((e) => e.id == type.id))
          ..add(type);
        final newDetail = detail.copyWith(
          totalTypeIds: detail.types?.map((e) => e.id).toList(),
          types: newTypes
        );
        onUpdate(newDetail, type.id, type.name);
      });
    }
  }

  bool _isDisposed = false;
  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
  }

  List<List<UiChainEntry>> getChains(NetworkEvolutionChain evolutionChain) {
    final map = HashMap<int, UiChainEntry>();
    final queue = Queue<NetworkChainLink>()..add(evolutionChain.chain);
    while (queue.isNotEmpty) {
      final node = queue.removeFirst();
      final nodeId = getIdFromUrl(node.species.url);
      if (!map.containsKey(nodeId)) {
        map[nodeId] = UiChainEntry(
            pId: nodeId,
            prevId: 0,
            trigger: node.evolutionDetails.firstOrNull?.item?.name ?? "0",
            isLeaf: false
        );
      }
      if (node.evolvesTo.isEmpty) {
        final nodex = map[getIdFromUrl(node.species.url)];
        if (nodex != null) {
          map[nodeId] = nodex.copyWith(
              isLeaf: true
          );
        }
      }
      for (var evolveTo in node.evolvesTo) {
        queue.add(evolveTo);
        map[getIdFromUrl(evolveTo.species.url)] = UiChainEntry(
            pId: getIdFromUrl(evolveTo.species.url),
            prevId: nodeId,
            trigger: evolveTo.evolutionDetails.firstOrNull?.item?.name ?? "0",
            isLeaf: false
        );
      }
    }
    final chains = List<UiChainEntry?>.of([]);
    map.forEach((key, value) {
      chains.add(value);
    });
    List<List<UiChainEntry>> x = chains.where((it) => it?.isLeaf == true).map((leaf) {
      final list = List<UiChainEntry>.of([]);
      UiChainEntry? entry = leaf;
      while (entry != null) {
        list.add(entry);
        entry = chains.firstWhere((it) {
          return it?.pId == entry?.prevId;
        }, orElse: () => null);
      }
      return list.reversed.toList();
    }).toList();

    return x;
  }
}