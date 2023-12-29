import 'package:floor/floor.dart';

import '../../util/timber.dart';
import '../model/lang_value_version.dart';

class LangValueVersionConverter extends TypeConverter<List<LangValueVersion>, String> {
  static const _delimiter = "@";
  static const _subDelimiter = "=";

  @override
  List<LangValueVersion> decode(String databaseValue) {
    try {
      Timber.i("LangValueVersionConverter.decode()");
      return databaseValue.split(_delimiter).where((e) => e.isNotEmpty).map((e) {
        return LangValueVersion(
          lang: e.split(_subDelimiter)[0],
          value: e.split("=")[1],
          version: e.split(_subDelimiter)[2],
        );
      }
      ).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("LangValueVersionConverter.decode()");
    }
  }

  @override
  String encode(List<LangValueVersion> value) {
    try {
      Timber.i("LangValueVersionConverter.encode()");
      return value.fold("", (acc, flavor) {
        return "$acc$_delimiter${flavor.lang}$_subDelimiter${flavor.value}$_subDelimiter${flavor.version}";
      });
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("LangValueVersionConverter.encode()");
    }
  }
}