// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_evolution_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkEvolutionChainImpl _$$NetworkEvolutionChainImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkEvolutionChainImpl(
      id: json['id'] as int,
      chain: NetworkChainLink.fromJson(json['chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NetworkEvolutionChainImplToJson(
        _$NetworkEvolutionChainImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chain': instance.chain,
    };
