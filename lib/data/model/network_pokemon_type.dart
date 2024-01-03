import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_named_api_resource.dart';

part 'network_pokemon_type.freezed.dart';
part 'network_pokemon_type.g.dart';

@freezed
class NetworkPokemonType with _$NetworkPokemonType {
  factory NetworkPokemonType({
    @JsonKey(name: 'slot') required int slot,
    @JsonKey(name: 'type') required NetworkNamedAPIResource type,
  }) = _NetworkPokemonType;

  factory NetworkPokemonType.fromJson(Map<String, dynamic> json)
    => _$NetworkPokemonTypeFromJson(json);
}