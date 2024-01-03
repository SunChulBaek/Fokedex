import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_api_resource.freezed.dart';
part 'network_api_resource.g.dart';

@freezed
class NetworkAPIResource with _$NetworkAPIResource {
  factory NetworkAPIResource({
    @JsonKey(name: 'url') required String url,
  }) = _NetworkAPIResource;

  factory NetworkAPIResource.fromJson(Map<String, dynamic> json)
    => _$NetworkAPIResourceFromJson(json);
}