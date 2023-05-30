// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_flavor_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkFlavorText _$NetworkFlavorTextFromJson(Map<String, dynamic> json) =>
    NetworkFlavorText(
      flavorText: json['flavor_text'] as String,
      language: NetworkNamedAPIResource.fromJson(
          json['language'] as Map<String, dynamic>),
      version: NetworkNamedAPIResource.fromJson(
          json['version'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NetworkFlavorTextToJson(NetworkFlavorText instance) =>
    <String, dynamic>{
      'flavor_text': instance.flavorText,
      'language': instance.language,
      'version': instance.version,
    };
