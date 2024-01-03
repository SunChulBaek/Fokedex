import 'dart:convert';

import 'package:floor/floor.dart';

import '../../util/timber.dart';
import '../model/lang_value.dart';

class LangValueConverter extends TypeConverter<List<LangValue>, String> {

  @override
  List<LangValue> decode(String databaseValue) {
    try {
      Timber.i("LangValueConverter.decode($databaseValue)");
      final List<dynamic> list = jsonDecode(databaseValue);
      return list.map((e) => LangValue.fromJson(e)).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("LangValueConverter.decode()");
    }
  }

  @override
  String encode(List<LangValue> value) {
    try {
      Timber.i("LangValueConverter.encode()");
      return jsonEncode(value.map((e) => e.toJson()).toList());
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("LangValueConverter.encode()");
    }
  }
}