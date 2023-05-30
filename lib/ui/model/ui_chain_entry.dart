import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_chain_entry.freezed.dart';

@freezed
class UiChainEntry with _$UiChainEntry {
  factory UiChainEntry({
    required int pId,
    required int prevId,
    required String trigger,
    required bool isLeaf
  }) = _UiChainEntry;
}