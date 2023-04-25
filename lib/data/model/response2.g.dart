// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Response2<T> _$Response2FromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    Response2<T>(
      json['count'] as int,
      json['previous'] as String?,
      json['next'] as String?,
      fromJsonT(json['results']),
    );

Map<String, dynamic> _$Response2ToJson<T>(
  Response2<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'count': instance.count,
      'previous': instance.prev,
      'next': instance.next,
      'results': toJsonT(instance.results),
    };
