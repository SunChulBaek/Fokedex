import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/timber.dart';
import 'network_named_api_resource.dart';

part 'network_named_api_resource_list.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class NetworkNamedAPIResourceList<T> {
  NetworkNamedAPIResourceList(this.count, this.prev, this.next, this.results);

  @JsonKey(name: 'count') final int count;
  @JsonKey(name: 'previous') final String? prev;
  @JsonKey(name: 'next') final String? next;
  @JsonKey(name: 'results') final List<NetworkNamedAPIResource> results;

  factory NetworkNamedAPIResourceList.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    try {
      return _$NetworkNamedAPIResourceListFromJson(json, fromJsonT);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkNamedAPIResourceList.fromJson()');
  }

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) {
    try {
      return _$NetworkNamedAPIResourceListToJson(this, toJsonT);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkNamedAPIResourceList.toJson()');
  }
}