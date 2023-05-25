// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkType _$NetworkTypeFromJson(Map<String, dynamic> json) => NetworkType(
      id: json['id'] as int,
      name: json['name'] as String,
      names: (json['names'] as List<dynamic>)
          .map((e) => NetworkName.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkTypeToJson(NetworkType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'names': instance.names,
    };
