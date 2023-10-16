// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_chain_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UiChainEntry {
  int get pId => throw _privateConstructorUsedError;
  int get prevId => throw _privateConstructorUsedError;
  String get trigger => throw _privateConstructorUsedError;
  bool get isLeaf => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UiChainEntryCopyWith<UiChainEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiChainEntryCopyWith<$Res> {
  factory $UiChainEntryCopyWith(
          UiChainEntry value, $Res Function(UiChainEntry) then) =
      _$UiChainEntryCopyWithImpl<$Res, UiChainEntry>;
  @useResult
  $Res call({int pId, int prevId, String trigger, bool isLeaf});
}

/// @nodoc
class _$UiChainEntryCopyWithImpl<$Res, $Val extends UiChainEntry>
    implements $UiChainEntryCopyWith<$Res> {
  _$UiChainEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pId = null,
    Object? prevId = null,
    Object? trigger = null,
    Object? isLeaf = null,
  }) {
    return _then(_value.copyWith(
      pId: null == pId
          ? _value.pId
          : pId // ignore: cast_nullable_to_non_nullable
              as int,
      prevId: null == prevId
          ? _value.prevId
          : prevId // ignore: cast_nullable_to_non_nullable
              as int,
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String,
      isLeaf: null == isLeaf
          ? _value.isLeaf
          : isLeaf // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UiChainEntryImplCopyWith<$Res>
    implements $UiChainEntryCopyWith<$Res> {
  factory _$$UiChainEntryImplCopyWith(
          _$UiChainEntryImpl value, $Res Function(_$UiChainEntryImpl) then) =
      __$$UiChainEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int pId, int prevId, String trigger, bool isLeaf});
}

/// @nodoc
class __$$UiChainEntryImplCopyWithImpl<$Res>
    extends _$UiChainEntryCopyWithImpl<$Res, _$UiChainEntryImpl>
    implements _$$UiChainEntryImplCopyWith<$Res> {
  __$$UiChainEntryImplCopyWithImpl(
      _$UiChainEntryImpl _value, $Res Function(_$UiChainEntryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pId = null,
    Object? prevId = null,
    Object? trigger = null,
    Object? isLeaf = null,
  }) {
    return _then(_$UiChainEntryImpl(
      pId: null == pId
          ? _value.pId
          : pId // ignore: cast_nullable_to_non_nullable
              as int,
      prevId: null == prevId
          ? _value.prevId
          : prevId // ignore: cast_nullable_to_non_nullable
              as int,
      trigger: null == trigger
          ? _value.trigger
          : trigger // ignore: cast_nullable_to_non_nullable
              as String,
      isLeaf: null == isLeaf
          ? _value.isLeaf
          : isLeaf // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$UiChainEntryImpl implements _UiChainEntry {
  _$UiChainEntryImpl(
      {required this.pId,
      required this.prevId,
      required this.trigger,
      required this.isLeaf});

  @override
  final int pId;
  @override
  final int prevId;
  @override
  final String trigger;
  @override
  final bool isLeaf;

  @override
  String toString() {
    return 'UiChainEntry(pId: $pId, prevId: $prevId, trigger: $trigger, isLeaf: $isLeaf)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiChainEntryImpl &&
            (identical(other.pId, pId) || other.pId == pId) &&
            (identical(other.prevId, prevId) || other.prevId == prevId) &&
            (identical(other.trigger, trigger) || other.trigger == trigger) &&
            (identical(other.isLeaf, isLeaf) || other.isLeaf == isLeaf));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pId, prevId, trigger, isLeaf);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UiChainEntryImplCopyWith<_$UiChainEntryImpl> get copyWith =>
      __$$UiChainEntryImplCopyWithImpl<_$UiChainEntryImpl>(this, _$identity);
}

abstract class _UiChainEntry implements UiChainEntry {
  factory _UiChainEntry(
      {required final int pId,
      required final int prevId,
      required final String trigger,
      required final bool isLeaf}) = _$UiChainEntryImpl;

  @override
  int get pId;
  @override
  int get prevId;
  @override
  String get trigger;
  @override
  bool get isLeaf;
  @override
  @JsonKey(ignore: true)
  _$$UiChainEntryImplCopyWith<_$UiChainEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
