// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_evolution_chain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkEvolutionChain _$NetworkEvolutionChainFromJson(
        Map<String, dynamic> json) =>
    NetworkEvolutionChain(
      id: json['id'] as int,
      chain: NetworkChainLink.fromJson(json['chain'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkEvolutionChainToJson(
        NetworkEvolutionChain instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chain': instance.chain,
    };
