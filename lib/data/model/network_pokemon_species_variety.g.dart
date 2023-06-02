// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_pokemon_species_variety.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPokemonSpeciesVariety _$NetworkPokemonSpeciesVarietyFromJson(
        Map<String, dynamic> json) =>
    NetworkPokemonSpeciesVariety(
      isDefault: json['is_default'] as bool,
      pokemon: NetworkNamedAPIResource.fromJson(
          json['pokemon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkPokemonSpeciesVarietyToJson(
        NetworkPokemonSpeciesVariety instance) =>
    <String, dynamic>{
      'is_default': instance.isDefault,
      'pokemon': instance.pokemon,
    };
