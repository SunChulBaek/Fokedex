import 'dart:convert';

import 'package:floor/floor.dart';

import '../../util/timber.dart';
import '../model/lang_value_version.dart';

class LangValueVersionConverter extends TypeConverter<List<LangValueVersion>, String> {

  @override
  List<LangValueVersion> decode(String databaseValue) {
    try {
      Timber.i("LangValueVersionConverter.decode($databaseValue)");
      final List<dynamic> list = jsonDecode(databaseValue);
      return list.map((e) => LangValueVersion.fromJson(e)).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("LangValueVersionConverter.decode()");
    }
  }

  @override
  String encode(List<LangValueVersion> value) {
    try {
      Timber.i("LangValueVersionConverter.encode()");
      return jsonEncode(value.map((e) => e.toJson()).toList());
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("LangValueVersionConverter.encode()");
    }
  }
}