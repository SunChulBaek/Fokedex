import 'package:flutter_template/data/model/network_pokemon_type.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_pokemon_stat.dart';

part 'network_pokemon.freezed.dart';
part 'network_pokemon.g.dart';

@freezed
@JsonSerializable()
class NetworkPokemon with _$NetworkPokemon {
  factory NetworkPokemon({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'base_experience') required int baseExp,
    @JsonKey(name: 'height') required int height,
    @JsonKey(name: 'is_default') required bool isDefault,
    @JsonKey(name: 'order') required int order,
    @JsonKey(name: 'weight') required int weight,
    @JsonKey(name: 'types') required List<NetworkPokemonType> types,
    @JsonKey(name: 'stats') required List<NetworkPokemonStat> stats,
  }) = _NetworkPokemon;

  factory NetworkPokemon.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkPokemonFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkPokemon.fromJson()');
  }
}