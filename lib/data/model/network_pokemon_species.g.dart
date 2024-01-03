// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_pokemon_species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkPokemonSpeciesImpl _$$NetworkPokemonSpeciesImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkPokemonSpeciesImpl(
      id: json['id'] as int,
      names: (json['names'] as List<dynamic>)
          .map((e) => NetworkName.fromJson(e as Map<String, dynamic>))
          .toList(),
      flavorTextEntries: (json['flavor_text_entries'] as List<dynamic>)
          .map((e) => NetworkFlavorText.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolutionChain: NetworkAPIResource.fromJson(
          json['evolution_chain'] as Map<String, dynamic>),
      varieties: (json['varieties'] as List<dynamic>)
          .map((e) =>
              NetworkPokemonSpeciesVariety.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NetworkPokemonSpeciesImplToJson(
        _$NetworkPokemonSpeciesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'names': instance.names,
      'flavor_text_entries': instance.flavorTextEntries,
      'evolution_chain': instance.evolutionChain,
      'varieties': instance.varieties,
    };
