import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_named_api_resource.freezed.dart';
part 'network_named_api_resource.g.dart';

@freezed
@JsonSerializable()
class NetworkNamedAPIResource with _$NetworkNamedAPIResource {
  factory NetworkNamedAPIResource({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _NetworkNamedAPIResource;

  factory NetworkNamedAPIResource.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkNamedAPIResourceFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkNamedAPIResource.fromJson()');
  }
}