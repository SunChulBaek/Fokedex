import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_named_api_resource.freezed.dart';
part 'network_named_api_resource.g.dart';

@freezed
class NetworkNamedAPIResource with _$NetworkNamedAPIResource {
  factory NetworkNamedAPIResource({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _NetworkNamedAPIResource;

  factory NetworkNamedAPIResource.fromJson(Map<String, dynamic> json)
    => _$NetworkNamedAPIResourceFromJson(json);
}