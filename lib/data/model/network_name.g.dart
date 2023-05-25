// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkName _$NetworkNameFromJson(Map<String, dynamic> json) => NetworkName(
      name: json['name'] as String,
      language: NetworkNamedAPIResource.fromJson(
          json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkNameToJson(NetworkName instance) =>
    <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
    };
