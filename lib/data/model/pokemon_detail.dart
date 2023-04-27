import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_detail.freezed.dart';
part 'pokemon_detail.g.dart';

@freezed
@JsonSerializable()
class PokemonDetail with _$PokemonDetail {
  factory PokemonDetail({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'base_experience') required int baseExp,
    @JsonKey(name: 'height') required int height,
    @JsonKey(name: 'is_default') required bool isDefault,
    @JsonKey(name: 'order') required int order,
    @JsonKey(name: 'weight') required int weight,
  }) = _PokemonDetail;

  factory PokemonDetail.fromJson(Map<String, dynamic> json) {
    try {
      return _$PokemonDetailFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('PokemonDetail.fromJson()');
  }
}