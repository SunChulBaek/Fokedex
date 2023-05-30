import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter_template/ui/model/ui_chain_entry.dart';
import 'package:injectable/injectable.dart';

import '../data/model/network_chain_link.dart';
import '../data/repository.dart';
import '../ui/model/ui_pokemon_detail.dart';
import '../ui/model/ui_stat.dart';
import '../ui/model/ui_type.dart';
import '../util/converter.dart';
import '../util/timber.dart';
import 'model/ui_state.dart';

@injectable
class GetPokemonCubit extends Cubit<UiState> {
  GetPokemonCubit(this._repository, UiState state) : super(state);

  final Repository _repository;

  UiPokemonDetail? _detail;

  void init(int id) async {
    try {
      final pokemon = await _repository.getPokemon(id: id);
      _detail = UiPokemonDetail(
        id: pokemon.id,
        name: pokemon.name,
        flavorText: "",
        types: pokemon.types.map((e) =>
          UiType(id: getIdFromUrl(e.type.url), name: e.type.name)
        ).toList(),
        weight: pokemon.weight,
        height: pokemon.height,
        stats: pokemon.stats.map((e) =>
          UiStat(
            name: e.stat.name,
            value: e.baseStat
          )
        ).toList(),
        chains: List.of([])
      );
      emit(Success(data: _detail!));

      // Species (이름)
      _repository.getSpecies(
        id: getIdFromUrl(pokemon.species.url)
      ).then((species) {
        int evolutionChainId = getIdFromUrl(species.evolutionChain.url);
        Timber.d("[sunchulbaek] evolution chain id = $evolutionChainId");
        _detail = _detail?.copyWith(
          name: species.names.firstWhere((e) => e.language.name == 'ko').name,
          flavorText: species.flavorTextEntries.firstWhere((e) => e.language.name == 'ko').flavorText.replaceAll("\n", " ")
        );
        emit(Success(data: _detail!));

        // TODO : Evolution Chain 보여주기
        if (evolutionChainId > 0) {
          _repository.getEvolutionChain(id: evolutionChainId).then((value) {
            final map = HashMap<int, UiChainEntry>();
            final queue = Queue<NetworkChainLink>()..add(value.chain);
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
            final chains = List<UiChainEntry>.of([]);
            map.forEach((key, value) {
              chains.add(value);
            });
            _detail = _detail?.copyWith(
                chains: chains
            );
            emit(Success(data: _detail!));
          });
        }
      });

      // Type
      final types = List<UiType>.of([]);
      for (var type in pokemon.types) {
        _repository.getType(
          id: getIdFromUrl(type.type.url)
        ).then((value) {
          int idx = value.id;
          String typeInLocale = value.names
            .firstWhere((e) => e.language.name == 'ko')
            .name;
          types.add(UiType(id: idx, name: typeInLocale));
          _detail = _detail?.copyWith(types: types);
          emit(Success(data: _detail!));
          }
        );
      }
    } catch (e) {
      Timber.e(e);
      emit(Error());
    }
  }
}