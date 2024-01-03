// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_pokemon_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkPokemonTypeImpl _$$NetworkPokemonTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkPokemonTypeImpl(
      slot: json['slot'] as int,
      type: NetworkNamedAPIResource.fromJson(
          json['type'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NetworkPokemonTypeImplToJson(
        _$NetworkPokemonTypeImpl instance) =>
    <String, dynamic>{
      'slot': instance.slot,
      'type': instance.type,
    };
