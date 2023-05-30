// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_evolution_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkEvolutionDetail _$NetworkEvolutionDetailFromJson(
        Map<String, dynamic> json) =>
    NetworkEvolutionDetail(
      item: json['item'] == null
          ? null
          : NetworkNamedAPIResource.fromJson(
              json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkEvolutionDetailToJson(
        NetworkEvolutionDetail instance) =>
    <String, dynamic>{
      'item': instance.item,
    };
