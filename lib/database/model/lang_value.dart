import 'package:freezed_annotation/freezed_annotation.dart';

part 'lang_value.freezed.dart';
part 'lang_value.g.dart';

@freezed
class LangValue with _$LangValue {
  @JsonSerializable(explicitToJson: true)
  factory LangValue({
    @JsonKey(name: "lang") required String lang,
    @JsonKey(name: "value") required String value
  }) = _LangValue;

  factory LangValue.fromJson(Map<String, dynamic> json)
    => _$LangValueFromJson(json);
}