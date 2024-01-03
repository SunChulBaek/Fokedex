import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_named_api_resource.dart';

part 'network_pokemon_stat.freezed.dart';
part 'network_pokemon_stat.g.dart';

@freezed
class NetworkPokemonStat with _$NetworkPokemonStat {
  factory NetworkPokemonStat({
    @JsonKey(name: 'base_stat') required int baseStat,
    @JsonKey(name: 'effort') required int effort,
    @JsonKey(name: 'stat') required NetworkNamedAPIResource stat,
  }) = _NetworkPokemonStat;

  factory NetworkPokemonStat.fromJson(Map<String, dynamic> json)
    => _$NetworkPokemonStatFromJson(json);
}