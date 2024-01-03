// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_pokemon_species_variety.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkPokemonSpeciesVarietyImpl _$$NetworkPokemonSpeciesVarietyImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkPokemonSpeciesVarietyImpl(
      isDefault: json['is_default'] as bool,
      pokemon: NetworkNamedAPIResource.fromJson(
          json['pokemon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NetworkPokemonSpeciesVarietyImplToJson(
        _$NetworkPokemonSpeciesVarietyImpl instance) =>
    <String, dynamic>{
      'is_default': instance.isDefault,
      'pokemon': instance.pokemon,
    };
