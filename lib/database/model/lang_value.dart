import 'package:json_annotation/json_annotation.dart';

import '../../util/timber.dart';

part 'lang_value.g.dart';

@JsonSerializable()
class LangValue {
  LangValue({
    required this.lang,
    required this.value,
  });

  @JsonKey(name: "lang") final String lang;
  @JsonKey(name: "value") final String value;

  factory LangValue.fromJson(Map<String, dynamic> json) {
    try {
      return _$LangValueFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkName.fromJson()');
  }

  Map<String, dynamic> toJson() {
    try {
      return _$LangValueToJson(this);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkName.toJson()');
  }
}