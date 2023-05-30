// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_pokemon_species.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkPokemonSpecies _$NetworkPokemonSpeciesFromJson(
        Map<String, dynamic> json) =>
    NetworkPokemonSpecies(
      id: json['id'] as int,
      names: (json['names'] as List<dynamic>)
          .map((e) => NetworkName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkPokemonSpeciesToJson(
        NetworkPokemonSpecies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'names': instance.names,
    };
