import 'package:flutter_template/ui/model/ui_stat.dart';
import 'package:flutter_template/ui/model/ui_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_pokemon_detail.freezed.dart';

@freezed
class UiPokemonDetail with _$UiPokemonDetail {
  factory UiPokemonDetail({
    required int id,
    required String name,
    required List<UiType> types,
    required int weight,
    required int height,
    required List<UiStat> stats,
  }) = _UiPokemonDetail;
}