// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_pokemon_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPokemonType _$NetworkPokemonTypeFromJson(Map<String, dynamic> json) =>
    NetworkPokemonType(
      slot: json['slot'] as int,
      type: NetworkNamedAPIResource.fromJson(
          json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkPokemonTypeToJson(NetworkPokemonType instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
