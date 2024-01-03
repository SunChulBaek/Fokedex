// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_evolution_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkEvolutionDetailImpl _$$NetworkEvolutionDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkEvolutionDetailImpl(
      item: json['item'] == null
          ? null
          : NetworkNamedAPIResource.fromJson(
              json['item'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NetworkEvolutionDetailImplToJson(
        _$NetworkEvolutionDetailImpl instance) =>
    <String, dynamic>{
      'item': instance.item,
    };
