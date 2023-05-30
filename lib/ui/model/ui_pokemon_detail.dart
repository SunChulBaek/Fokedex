import 'package:freezed_annotation/freezed_annotation.dart';

import 'ui_chain_entry.dart';
import 'ui_stat.dart';
import 'ui_type.dart';

part 'ui_pokemon_detail.freezed.dart';

@freezed
class UiPokemonDetail with _$UiPokemonDetail {
  factory UiPokemonDetail({
    required int id,
    required String name,
    required String flavorText,
    required List<UiType> types,
    required int weight,
    required int height,
    required List<UiStat> stats,
    required List<UiChainEntry> chains,
  }) = _UiPokemonDetail;
}