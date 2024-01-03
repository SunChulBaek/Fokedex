// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkTypeImpl _$$NetworkTypeImplFromJson(Map<String, dynamic> json) =>
    _$NetworkTypeImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      names: (json['names'] as List<dynamic>)
          .map((e) => NetworkName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NetworkTypeImplToJson(_$NetworkTypeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'names': instance.names,
    };
