import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/data/model/network_pokemon_species.dart';
import 'package:flutter_template/ui/model/ui_chain_entry.dart';
import 'package:injectable/injectable.dart';

import '../data/model/network_chain_link.dart';
import '../data/model/network_evolution_chain.dart';
import '../data/model/network_pokemon.dart';
import '../data/model/network_pokemon_type.dart';
import '../data/repository.dart';
import '../ui/model/ui_pokemon_detail.dart';
import '../ui/model/ui_pokemon_detail_item.dart';
import '../ui/model/ui_type.dart';
import '../util/converter.dart';
import '../util/timber.dart';
import 'model/ui_pokemon_detail_data.dart';
import 'model/ui_state.dart';

@injectable
class GetPokemonCubit extends Cubit<UiState> {
  static const int _indexName = 1;
  static const int _indexStat = 2;
  static const int _indexFlavorText = 3;
  static const int _indexEvolutionChain = 4;

  GetPokemonCubit(this._repository, UiState state) : super(state);

  final Repository _repository;

  UiPokemonDetail detail = UiPokemonDetail();

  final List<UiPokemonDetailItem> items = List.of([]);

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
        emit(Error());
      }
    }
  }

  void simpleUpdate(
    UiPokemonDetail pokemon,
    List<UiPokemonDetailItem> items
  ) {
    detail = pokemon;
    this.items.addAll(items);
    if (!_isDisposed) {
      emit(Success(data: UiPokemonDetailData(
        pokemon: detail,
        items: this.items
      )));
    }
  }

  void setLocalizedName(
    String localizedName,
    UiPokemonDetail pokemon,
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
    UiPokemonDetail pokemon,
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
    UiPokemonDetail pokemon,
    int typeId,
    String typeName
  ) {
    final prevItem = items.removeAt(_indexStat);
    items.insert(_indexStat, UiPokemonDetailStat(
      weight: (prevItem as UiPokemonDetailStat).weight,
      height: (prevItem).height,
      types: (prevItem).types
        ..remove(prevItem.types.firstWhere((e) => e.id == typeId))
        ..add(UiType(id: typeId, name: typeName))
    ));
    simpleUpdate(pokemon, List.empty());
  }

  void setEvolutionChain(
    UiPokemonDetail pokemon,
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
      UiPokemonDetail pokemon,
      List<UiPokemonDetailItem> items
    ) onUpdate
  }) async {
    final pokemon = UiPokemonDetail(id: pId, name: name);
    final List<UiPokemonDetailItem> items = List.of([]);
    items.add(UiPokemonDetailImage(id: pId));
    items.add(UiPokemonDetailName(id: pId, defaultName: name));
    onUpdate(pokemon, items);
  }

  // 상세
  Future<NetworkPokemon> getDetail(
    int pId,
    UiPokemonDetail detail,
    void Function(
      UiPokemonDetail pokemon,
      List<UiPokemonDetailItem> items
    ) onUpdate
  ) async {
    final List<UiType> types = List<UiType>.of([]);
    final List<UiPokemonDetailItem> items = List.of([]);

    final pokemon = await _repository.getPokemon(id: pId);
    for (var e in pokemon.types) {
      types.add(UiType(id: getIdFromUrl(e.type.url), name: ""));
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
        UiType(id: getIdFromUrl(e.type.url), name: e.type.name)
      ).toList()
    ));
    onUpdate(newDetail, items);
    return pokemon;
  }

  // species
  Future<NetworkPokemonSpecies> getSpecies(
    NetworkPokemon pokemon,
    UiPokemonDetail detail,
    void Function(
      String localizedName,
      UiPokemonDetail pokemon,
      List<UiPokemonDetailItem> items
    ) onUpdate
  ) async {
    final List<UiPokemonDetailItem> items = List.of([]);
    final species = await _repository.getSpecies(id: getIdFromUrl(pokemon.species.url));
    final newDetail = detail.copyWith(
      flavorText: getFlavorTextForLocale(species.flavorTextEntries)
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
    UiPokemonDetail detail,
    void Function(
      UiPokemonDetail pokemon,
      List<List<UiChainEntry>> chains
    ) onUpdate
  ) async {
    if (ecId > 0) {
      await _repository.getEvolutionChain(id: ecId).then((evolutionChain) {
        final List<UiPokemonDetailItem> items = List.of([]);
        final chains = getChains(evolutionChain);
        final newDetail = detail.copyWith(chains: chains);
        onUpdate(newDetail, chains);
      });
    }
  }

  // Form
  Future<void> getForm(
    int pId,
    int fId,
    UiPokemonDetail detail,
    void Function(
      UiPokemonDetail pokemon,
      String form
    ) onUpdate
  ) async {
    await _repository.getForm(id: fId).then((form) {
      final newDetail = detail.copyWith(form: getNameForLocale(form.formNames));
      onUpdate(newDetail, getNameForLocale(form.formNames));
    });
  }

  // Type
  Future<void> getType(
    List<NetworkPokemonType> types,
    UiPokemonDetail detail,
    void Function(
      UiPokemonDetail pokemon,
      int typeId,
      String typeName
    ) onUpdate
  ) async {
    final newTypes = List<UiType>.from(detail.types!);
    for (var type in types) {
      _repository.getType(
        id: getIdFromUrl(type.type.url)
      ).then((type) {
        newTypes
          ..remove(detail.types?.firstWhere((e) => e.id == type.id))
          ..add(UiType(id: type.id, name: getNameForLocale(type.names)));
        final newDetail = detail.copyWith(types: newTypes);
        onUpdate(newDetail, type.id, getNameForLocale(type.names));
      });
    }
  }

  bool _isDisposed = false;
  void dispose() {
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
      node.evolvesTo.forEach((evolveTo) {
        queue.add(evolveTo);
        map[getIdFromUrl(evolveTo.species.url)] = UiChainEntry(
          pId: getIdFromUrl(evolveTo.species.url),
          prevId: nodeId,
          trigger: evolveTo.evolutionDetails.firstOrNull?.item?.name ?? "0",
          isLeaf: false
        );
      });
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