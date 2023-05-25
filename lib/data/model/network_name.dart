import 'package:flutter_template/data/model/network_named_api_resource.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_name.freezed.dart';
part 'network_name.g.dart';

@freezed
@JsonSerializable()
class NetworkName with _$NetworkName {
  factory NetworkName({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'language') required NetworkNamedAPIResource language,
  }) = _NetworkName;

  factory NetworkName.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkNameFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkName.fromJson()');
  }
}