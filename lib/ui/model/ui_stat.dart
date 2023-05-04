import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_stat.freezed.dart';

@freezed
class UiStat with _$UiStat {
  factory UiStat({
    required String name,
    required int value,
  }) = _UiStat;
}