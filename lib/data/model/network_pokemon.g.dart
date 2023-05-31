// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_pokemon.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPokemon _$NetworkPokemonFromJson(Map<String, dynamic> json) =>
    NetworkPokemon(
      id: json['id'] as int,
      name: json['name'] as String,
      height: json['height'] as int,
      isDefault: json['is_default'] as bool,
      order: json['order'] as int,
      weight: json['weight'] as int,
      forms: (json['forms'] as List<dynamic>)
          .map((e) =>
              NetworkNamedAPIResource.fromJson(e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List<dynamic>)
          .map((e) => NetworkPokemonType.fromJson(e as Map<String, dynamic>))
          .toList(),
      stats: (json['stats'] as List<dynamic>)
          .map((e) => NetworkPokemonStat.fromJson(e as Map<String, dynamic>))
          .toList(),
      species: NetworkNamedAPIResource.fromJson(
          json['species'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkPokemonToJson(NetworkPokemon instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'height': instance.height,
      'is_default': instance.isDefault,
      'order': instance.order,
      'weight': instance.weight,
      'forms': instance.forms,
      'types': instance.types,
      'stats': instance.stats,
      'species': instance.species,
    };
