// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_flavor_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkFlavorTextImpl _$$NetworkFlavorTextImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkFlavorTextImpl(
      flavorText: json['flavor_text'] as String,
      language: NetworkNamedAPIResource.fromJson(
          json['language'] as Map<String, dynamic>),
      version: NetworkNamedAPIResource.fromJson(
          json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NetworkFlavorTextImplToJson(
        _$NetworkFlavorTextImpl instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version': instance.version,
    };
