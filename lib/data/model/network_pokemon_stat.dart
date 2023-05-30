import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/timber.dart';
import 'network_named_api_resource.dart';

part 'network_pokemon_stat.freezed.dart';
part 'network_pokemon_stat.g.dart';

@freezed
@JsonSerializable()
class NetworkPokemonStat with _$NetworkPokemonStat {
  factory NetworkPokemonStat({
    @JsonKey(name: 'base_stat') required int baseStat,
    @JsonKey(name: 'effort') required int effort,
    @JsonKey(name: 'stat') required NetworkNamedAPIResource stat,
  }) = _NetworkPokemonStat;

  factory NetworkPokemonStat.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkPokemonStatFromJson(json);
    } catch(e) {
      Timber.e(e);
    }
    throw Exception('NetworkPokemonStat.fromJson()');
  }
}