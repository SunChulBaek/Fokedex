import 'package:floor/floor.dart';

import '../../util/timber.dart';
import '../model/lang_value.dart';

class LangValueConverter extends TypeConverter<List<LangValue>, String> {
  static const _delimiter = "@";
  static const _subDelimiter = "=";

  @override
  List<LangValue> decode(String databaseValue) {
    try {
      Timber.i("LangValueConverter.decode()");
      return databaseValue.split(_delimiter).where((e) => e.isNotEmpty).map((e) =>
          LangValue(
            lang: e.split(_subDelimiter)[0],
            value: e.split(_subDelimiter)[1],
          )
      ).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("LangValueConverter.decode()");
    }
  }

  @override
  String encode(List<LangValue> value) {
    try {
      Timber.i("LangValueConverter.encode()");
      return value.fold("", (acc, name) =>
      "$acc$_delimiter${name.lang}$_subDelimiter${name.value}"
      );
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("LangValueConverter.encode()");
    }
  }
}