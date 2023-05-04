// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPokemon _$NetworkPokemonFromJson(Map<String, dynamic> json) =>
    NetworkPokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      baseExp: json['base_experience'] as int,
      height: json['height'] as int,
      isDefault: json['is_default'] as bool,
      order: json['order'] as int,
      weight: json['weight'] as int,
      types: (json['types'] as List<dynamic>)
          .map((e) => NetworkPokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => NetworkPokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkPokemonToJson(NetworkPokemon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExp,
      'height': instance.height,
      'is_default': instance.isDefault,
      'order': instance.order,
      'weight': instance.weight,
      'types': instance.types,
      'stats': instance.stats,
    };
