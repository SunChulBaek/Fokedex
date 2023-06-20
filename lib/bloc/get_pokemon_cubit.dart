import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/ui/model/ui_chain_entry.dart';
import 'package:injectable/injectable.dart';

import '../data/model/network_chain_link.dart';
import '../data/model/network_evolution_chain.dart';
import '../data/repository.dart';
import '../ui/model/ui_pokemon_detail_item.dart';
import '../ui/model/ui_type.dart';
import '../util/converter.dart';
import '../util/timber.dart';
import 'model/ui_state.dart';

@injectable
class GetPokemonCubit extends Cubit<UiState> {
  static const int _indexName = 1;
  static const int _indexStat = 2;
  static const int _indexFlavorText = 3;
  static const int _indexEvolutionChain = 4;

  GetPokemonCubit(this._repository, UiState state) : super(state);

  final Repository _repository;

  final List<UiPokemonDetailItem> items = List.of([]);

  void init(int id) async {
    try {
      final pokemon = await _repository.getPokemon(id: id);
      items.add(UiPokemonDetailImage(id: id));
      items.add(UiPokemonDetailName(id: id, defaultName: pokemon.name));
      items.add(UiPokemonDetailStat(
        weight: pokemon.weight,
        height: pokemon.height,
        types: pokemon.types.map((e) =>
          UiType(id: getIdFromUrl(e.type.url), name: e.type.name)
        ).toList()
      ));
      if (!_isDisposed) {
        emit(Success(data: items));
      }

      // Species (이름)
      _repository.getSpecies(
        id: getIdFromUrl(pokemon.species.url)
      ).then((species) {
        final prevItem = items.removeAt(_indexName) as UiPokemonDetailName;
        items.insert(_indexName, UiPokemonDetailName(
          id: prevItem.id,
          defaultName: pokemon.name,
          name: getNameForLocale(species.names))
        );
        items.insert(_indexFlavorText, UiPokemonDetailFlavorText(
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
        if (!_isDisposed) {
          emit(Success(data: items));
        }

        // Evolution Chain 보여주기
        final evolutionChainId = getIdFromUrl(species.evolutionChain.url);
        if (evolutionChainId > 0) {
          _repository.getEvolutionChain(id: evolutionChainId).then((evolutionChain) {
            final chains = getChains(evolutionChain);
            if (maxEvolutionChainLength(chains) > 1) {
              items.insert(_indexEvolutionChain,
                UiPokemonDetailEvolutionChains(pId: pokemon.id, chains: chains)
              );
              if (!_isDisposed) {
                emit(Success(data: items));
              }
            }
          });
        }
      });

      // Form
      final formId = getIdFromUrl(pokemon.forms.first.url);
      _repository.getForm(id: formId).then((form) {
        final prevItem = items.removeAt(_indexName);
        items.insert(_indexName, UiPokemonDetailName(
          id: id,
          defaultName: pokemon.name,
          name: (prevItem as UiPokemonDetailName).name,
          form: getNameForLocale(form.formNames)
        ));
        if (!_isDisposed) {
          emit(Success(data: items));
        }
      });

      // Type
      for (var type in pokemon.types) {
        _repository.getType(
          id: getIdFromUrl(type.type.url)
        ).then((form) {
          final prevItem = items.removeAt(_indexStat);
          items.insert(_indexStat, UiPokemonDetailStat(
            weight: (prevItem as UiPokemonDetailStat).weight,
            height: (prevItem).height,
            types: (prevItem).types
              ..remove(prevItem.types.firstWhere((e) => e.id == form.id))
              ..add(UiType(id: form.id, name: getNameForLocale(form.names)))
          ));
          if (!_isDisposed) {
            emit(Success(data: items));
          }
        });
      }
    } catch (e) {
      Timber.e(e);
      if (!_isDisposed) {
        emit(Error());
      }
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