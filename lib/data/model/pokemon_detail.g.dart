// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PokemonDetail _$PokemonDetailFromJson(Map<String, dynamic> json) =>
    PokemonDetail(
      id: json['id'] as int,
      name: json['name'] as String,
      baseExp: json['base_experience'] as int,
      height: json['height'] as int,
      isDefault: json['is_default'] as bool,
      order: json['order'] as int,
      weight: json['weight'] as int,
    );

Map<String, dynamic> _$PokemonDetailToJson(PokemonDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'base_experience': instance.baseExp,
      'height': instance.height,
      'is_default': instance.isDefault,
      'order': instance.order,
      'weight': instance.weight,
    };
