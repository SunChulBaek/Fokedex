import 'package:flutter_template/data/model/network_name.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_type.freezed.dart';
part 'network_type.g.dart';

@freezed
@JsonSerializable()
class NetworkType with _$NetworkType {
  factory NetworkType({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'names') required List<NetworkName> names,
  }) = _NetworkType;

  factory NetworkType.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkTypeFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkType.fromJSon()');
  }
}