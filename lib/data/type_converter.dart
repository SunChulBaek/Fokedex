import '../database/model/lang_value.dart';
import '../database/model/lang_value_version.dart';
import '../util/timber.dart';

class TypeConverter {
  static const _delimiter = "@";
  static const _subDelimiter = "=";

  static String namesToString(List<LangValue> names) {
    try {
      Timber.i("TypeConverter.namesToString()");
      return names.fold("", (acc, name) =>
        "$acc$_delimiter${name.lang}$_subDelimiter${name.value}"
      );
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.namesToString()");
    }
  }

  static List<LangValue> stringToNames(String string) {
    try {
      Timber.i("TypeConverter.stringToNames()");
      return string.split(_delimiter).where((e) => e.isNotEmpty).map((e) =>
        LangValue(
          lang: e.split(_subDelimiter)[0],
          value: e.split(_subDelimiter)[1],
        )
      ).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.stringToNames()");
    }
  }

  static String flavorsToString(List<LangValueVersion> flavors) {
    try {
      Timber.i("TypeConverter.flavorsToString()");
      return flavors.fold("", (acc, flavor) {
        return "$acc$_delimiter${flavor.lang}$_subDelimiter${flavor.value}$_subDelimiter${flavor.version}";
      });
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.flavorsToString()");
    }
  }

  static List<LangValueVersion> stringToFlavors(String string) {
    try {
      Timber.i("TypeConverter.stringToFlavors()");
      return string.split(_delimiter).where((e) => e.isNotEmpty).map((e) {
        return LangValueVersion(
          lang: e.split(_subDelimiter)[0],
          value: e.split("=")[1],
          version: e.split(_subDelimiter)[2],
        );
      }
      ).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.stringToFlavors()");
    }
  }

  static String idsToString(List<int>? varieties) {
    try {
      Timber.i("TypeConverter.idsToString()");
      return varieties?.fold("", (acc, e) =>
        "$acc$_delimiter$e"
      ) ?? "";
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.idsToString()");
    }
  }

  static List<int> stringToIds(String string) {
    try {
      return string.split(_delimiter).where((e) => e.isNotEmpty).map((e) {
        Timber.i("TypeConverter.stringToIds()");
        return int.parse(e);
      }).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.stringToIds()");
    }
  }
}