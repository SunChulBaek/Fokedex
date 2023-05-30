import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/timber.dart';

part 'network_api_resource.freezed.dart';
part 'network_api_resource.g.dart';

@freezed
@JsonSerializable()
class NetworkAPIResource with _$NetworkAPIResource {
  factory NetworkAPIResource({
    @JsonKey(name: 'url') required String url,
  }) = _NetworkAPIResource;

  factory NetworkAPIResource.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkAPIResourceFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkAPIResource.fromJson()');
  }
}