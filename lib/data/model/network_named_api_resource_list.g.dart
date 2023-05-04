// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_named_api_resource_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetworkNamedAPIResourceList<T> _$NetworkNamedAPIResourceListFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    NetworkNamedAPIResourceList<T>(
      json['count'] as int,
      json['previous'] as String?,
      json['next'] as String?,
      (json['results'] as List<dynamic>)
          .map((e) =>
              NetworkNamedAPIResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NetworkNamedAPIResourceListToJson<T>(
  NetworkNamedAPIResourceList<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'previous': instance.prev,
      'next': instance.next,
      'results': instance.results,
    };
