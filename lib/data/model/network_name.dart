import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_named_api_resource.dart';

part 'network_name.freezed.dart';
part 'network_name.g.dart';

@freezed
class NetworkName with _$NetworkName {
  factory NetworkName({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'language') required NetworkNamedAPIResource language,
  }) = _NetworkName;

  factory NetworkName.fromJson(Map<String, dynamic> json)
    => _$NetworkNameFromJson(json);
}