import 'package:freezed_annotation/freezed_annotation.dart';
import '../../ui/model/ui_pokemon_detail.dart';
import '../../ui/model/ui_pokemon_detail_item.dart';

part 'ui_pokemon_detail_data.freezed.dart';

@freezed
class UiPokemonDetailData with _$UiPokemonDetailData {
  factory UiPokemonDetailData ({
    required UiPokemonDetail? pokemon,
    required List<UiPokemonDetailItem> items,
  }) = _UiPokemonDetailData;
}