// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_pokemon_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkPokemonFormImpl _$$NetworkPokemonFormImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkPokemonFormImpl(
      id: json['id'] as int,
      formNames: (json['form_names'] as List<dynamic>)
          .map((e) => NetworkName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NetworkPokemonFormImplToJson(
        _$NetworkPokemonFormImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'form_names': instance.formNames,
    };
