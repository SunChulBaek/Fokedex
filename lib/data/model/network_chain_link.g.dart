// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_chain_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkChainLinkImpl _$$NetworkChainLinkImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkChainLinkImpl(
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

Map<String, dynamic> _$$NetworkChainLinkImplToJson(
        _$NetworkChainLinkImpl instance) =>
    <String, dynamic>{
      'is_baby': instance.isBaby,
      'species': instance.species,
      'evolution_details': instance.evolutionDetails,
      'evolves_to': instance.evolvesTo,
    };
