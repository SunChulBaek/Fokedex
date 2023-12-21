import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/timber.dart';
import 'network_named_api_resource.dart';

part 'network_pokemon_species_variety.freezed.dart';
part 'network_pokemon_species_variety.g.dart';

@freezed
@JsonSerializable()
class NetworkPokemonSpeciesVariety with _$NetworkPokemonSpeciesVariety {
  factory NetworkPokemonSpeciesVariety({
    @JsonKey(name: 'is_default') required bool isDefault,
    @JsonKey(name: 'pokemon') required NetworkNamedAPIResource pokemon,
  }) = _NetworkPokemonSpeciesVariety;

  factory NetworkPokemonSpeciesVariety.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkPokemonSpeciesVarietyFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkPokemonSpecies.fromJson()');
  }
}