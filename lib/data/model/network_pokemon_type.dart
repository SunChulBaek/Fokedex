import 'package:flutter_template/data/model/network_named_api_resource.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_pokemon_type.freezed.dart';
part 'network_pokemon_type.g.dart';

@freezed
@JsonSerializable()
class NetworkPokemonType with _$NetworkPokemonType {
  factory NetworkPokemonType({
    @JsonKey(name: 'slot') required int slot,
    @JsonKey(name: 'type') required NetworkNamedAPIResource type,
  }) = _NetworkPokemonType;

  factory NetworkPokemonType.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkPokemonTypeFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkPokemonType.fromJson()');
  }
}