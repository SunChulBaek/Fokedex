import 'package:freezed_annotation/freezed_annotation.dart';

part 'lang_value_version.freezed.dart';
part 'lang_value_version.g.dart';

@freezed
class LangValueVersion with _$LangValueVersion {
  @JsonSerializable(explicitToJson: true)
  factory LangValueVersion({
    @JsonKey(name: "lang") required String lang,
    @JsonKey(name: "value") required String value,
    @JsonKey(name: "version") required String version
  }) = _LangValueVersion;

  factory LangValueVersion.fromJson(Map<String, dynamic> json)
    => _$LangValueVersionFromJson(json);
}