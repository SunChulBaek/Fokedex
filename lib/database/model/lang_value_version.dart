import 'package:json_annotation/json_annotation.dart';

import '../../util/timber.dart';

part 'lang_value_version.g.dart';

@JsonSerializable()
class LangValueVersion {
  LangValueVersion({
    required this.lang,
    required this.value,
    required this.version
  });

  @JsonKey(name: "lang") final String lang;
  @JsonKey(name: "value") final String value;
  @JsonKey(name: "version") final String version;

  factory LangValueVersion.fromJson(Map<String, dynamic> json) {
    try {
      return _$LangValueVersionFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkName.fromJson()');
  }

  Map<String, dynamic> toJson() {
    try {
      return _$LangValueVersionToJson(this);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkName.toJson()');
  }
}