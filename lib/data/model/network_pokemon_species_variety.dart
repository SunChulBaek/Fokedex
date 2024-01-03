import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_named_api_resource.dart';

part 'network_pokemon_species_variety.freezed.dart';
part 'network_pokemon_species_variety.g.dart';

@freezed
class NetworkPokemonSpeciesVariety with _$NetworkPokemonSpeciesVariety {
  factory NetworkPokemonSpeciesVariety({
    @JsonKey(name: 'is_default') required bool isDefault,
    @JsonKey(name: 'pokemon') required NetworkNamedAPIResource pokemon,
  }) = _NetworkPokemonSpeciesVariety;

  factory NetworkPokemonSpeciesVariety.fromJson(Map<String, dynamic> json)
    => _$NetworkPokemonSpeciesVarietyFromJson(json);
}