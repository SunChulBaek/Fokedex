import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_name.dart';

part 'network_type.freezed.dart';
part 'network_type.g.dart';

@freezed
class NetworkType with _$NetworkType {
  factory NetworkType({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'names') required List<NetworkName> names,
  }) = _NetworkType;

  factory NetworkType.fromJson(Map<String, dynamic> json)
    => _$NetworkTypeFromJson(json);
}