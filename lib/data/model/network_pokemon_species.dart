import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_api_resource.dart';
import 'network_flavor_text.dart';
import 'network_name.dart';
import 'network_pokemon_species_variety.dart';

part 'network_pokemon_species.freezed.dart';
part 'network_pokemon_species.g.dart';

@freezed
class NetworkPokemonSpecies with _$NetworkPokemonSpecies {
  factory NetworkPokemonSpecies({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'names') required List<NetworkName> names,
    @JsonKey(name: 'flavor_text_entries') required List<NetworkFlavorText> flavorTextEntries,
    @JsonKey(name: 'evolution_chain') required NetworkAPIResource evolutionChain,
    @JsonKey(name: 'varieties') required List<NetworkPokemonSpeciesVariety> varieties,
  }) = _NetworkPokemonSpecies;

  factory NetworkPokemonSpecies.fromJson(Map<String, dynamic> json)
    => _$NetworkPokemonSpeciesFromJson(json);
}