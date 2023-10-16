import 'package:freezed_annotation/freezed_annotation.dart';

import 'ui_chain_entry.dart';
import 'ui_stat.dart';
import 'ui_type.dart';

part 'ui_pokemon_detail.freezed.dart';

@freezed
class UiPokemonDetail with _$UiPokemonDetail {
  factory UiPokemonDetail({
    int? id,
    String? name,
    String? form,
    String? flavorText,
    List<UiType>? types,
    int? weight,
    int? height,
    List<UiStat>? stats,
    List<List<UiChainEntry>>? chains,
    List<int>? varietyIds,
  }) = _UiPokemonDetail;
}