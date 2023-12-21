// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_chain_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkChainLink _$NetworkChainLinkFromJson(Map<String, dynamic> json) =>
    NetworkChainLink(
      isBaby: json['is_baby'] as bool,
      species: NetworkNamedAPIResource.fromJson(
          json['species'] as Map<String, dynamic>),
      evolutionDetails: (json['evolution_details'] as List<dynamic>)
          .map(
              (e) => NetworkEvolutionDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      evolvesTo: (json['evolves_to'] as List<dynamic>)
          .map((e) => NetworkChainLink.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkChainLinkToJson(NetworkChainLink instance) =>
    <String, dynamic>{
      'is_baby': instance.isBaby,
      'species': instance.species,
      'evolution_details': instance.evolutionDetails,
      'evolves_to': instance.evolvesTo,
    };
