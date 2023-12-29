import 'package:floor/floor.dart';

import '../../util/timber.dart';

class IdsConverter extends TypeConverter<List<int>, String> {
  static const _delimiter = "@";
  static const _subDelimiter = "=";

  @override
  List<int> decode(String databaseValue) {
    try {
      return databaseValue.split(_delimiter).where((e) => e.isNotEmpty).map((e) {
        Timber.i("IdsConverter.decode()");
        return int.parse(e);
      }).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("IdsConverter.decode()");
    }
  }

  @override
  String encode(List<int> value) {
    try {
      Timber.i("IdsConverter.encode()");
      return value?.fold("", (acc, e) =>
      "$acc$_delimiter$e"
      ) ?? "";
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("IdsConverter.encode()");
    }
  }
}

class IdsConverter2 extends TypeConverter<List<int>?, String> {
  static const _delimiter = "@";
  static const _subDelimiter = "=";

  @override
  List<int>? decode(String databaseValue) {
    try {
      return databaseValue.split(_delimiter).where((e) => e.isNotEmpty).map((e) {
        Timber.i("IdsConverter2.decode()");
        return int.parse(e);
      }).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("IdsConverter2.decode()");
    }
  }

  @override
  String encode(List<int>? value) {
    try {
      Timber.i("IdsConverter2.encode()");
      return value?.fold("", (acc, e) =>
      "$acc$_delimiter$e"
      ) ?? "";
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("IdsConverter2.encode()");
    }
  }
}