// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_named_api_resource.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkNamedAPIResource _$NetworkNamedAPIResourceFromJson(
        Map<String, dynamic> json) =>
    NetworkNamedAPIResource(
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$NetworkNamedAPIResourceToJson(
        NetworkNamedAPIResource instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
