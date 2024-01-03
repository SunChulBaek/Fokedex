// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkNameImpl _$$NetworkNameImplFromJson(Map<String, dynamic> json) =>
    _$NetworkNameImpl(
      name: json['name'] as String,
      language: NetworkNamedAPIResource.fromJson(
          json['language'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NetworkNameImplToJson(_$NetworkNameImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'language': instance.language,
    };
