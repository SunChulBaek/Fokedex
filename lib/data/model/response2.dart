import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response2.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Response2<T> {
  Response2(this.count, this.prev, this.next, this.results);

  @JsonKey(name: 'count') final int count;
  @JsonKey(name: 'previous') final String? prev;
  @JsonKey(name: 'next') final String? next;
  @JsonKey(name: 'results') final T results;

  factory Response2.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    try {
      return _$Response2FromJson(json, fromJsonT);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('Response2.fromJson()');
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    try {
      return _$Response2ToJson(this, toJsonT);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('Response2.toJson()');
  }
}