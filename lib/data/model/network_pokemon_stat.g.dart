// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_pokemon_stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkPokemonStatImpl _$$NetworkPokemonStatImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkPokemonStatImpl(
      baseStat: json['base_stat'] as int,
      effort: json['effort'] as int,
      stat: NetworkNamedAPIResource.fromJson(
          json['stat'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NetworkPokemonStatImplToJson(
        _$NetworkPokemonStatImpl instance) =>
    <String, dynamic>{
      'base_stat': instance.baseStat,
      'effort': instance.effort,
      'stat': instance.stat,
    };
