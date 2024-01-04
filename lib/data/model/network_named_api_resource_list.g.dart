// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_named_api_resource_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NetworkNamedAPIResourceListImpl _$$NetworkNamedAPIResourceListImplFromJson(
        Map<String, dynamic> json) =>
    _$NetworkNamedAPIResourceListImpl(
      count: json['count'] as int,
      prev: json['previous'] as String?,
      next: json['next'] as String?,
      results: (json['results'] as List<dynamic>)
          .map((e) =>
              NetworkNamedAPIResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NetworkNamedAPIResourceListImplToJson(
        _$NetworkNamedAPIResourceListImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'previous': instance.prev,
      'next': instance.next,
      'results': instance.results,
    };
