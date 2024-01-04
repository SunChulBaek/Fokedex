import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_named_api_resource.dart';

part 'network_named_api_resource_list.freezed.dart';
part 'network_named_api_resource_list.g.dart';

@freezed
class NetworkNamedAPIResourceList with _$NetworkNamedAPIResourceList {
  factory NetworkNamedAPIResourceList({
    @JsonKey(name: 'count') required int count,
    @JsonKey(name: 'previous') required String? prev,
    @JsonKey(name: 'next') required String? next,
    @JsonKey(name: 'results') required List<NetworkNamedAPIResource> results
  }) = _NetworkNamedAPIResourceList;

  factory NetworkNamedAPIResourceList.fromJson(Map<String, dynamic> json)
    => _$NetworkNamedAPIResourceListFromJson(json);
}