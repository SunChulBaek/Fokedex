// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UiStat {
  String get name => throw _privateConstructorUsedError;
  int get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UiStatCopyWith<UiStat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiStatCopyWith<$Res> {
  factory $UiStatCopyWith(UiStat value, $Res Function(UiStat) then) =
      _$UiStatCopyWithImpl<$Res, UiStat>;
  @useResult
  $Res call({String name, int value});
}

/// @nodoc
class _$UiStatCopyWithImpl<$Res, $Val extends UiStat>
    implements $UiStatCopyWith<$Res> {
  _$UiStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UiStatCopyWith<$Res> implements $UiStatCopyWith<$Res> {
  factory _$$_UiStatCopyWith(_$_UiStat value, $Res Function(_$_UiStat) then) =
      __$$_UiStatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, int value});
}

/// @nodoc
class __$$_UiStatCopyWithImpl<$Res>
    extends _$UiStatCopyWithImpl<$Res, _$_UiStat>
    implements _$$_UiStatCopyWith<$Res> {
  __$$_UiStatCopyWithImpl(_$_UiStat _value, $Res Function(_$_UiStat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? value = null,
  }) {
    return _then(_$_UiStat(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UiStat implements _UiStat {
  _$_UiStat({required this.name, required this.value});

  @override
  final String name;
  @override
  final int value;

  @override
  String toString() {
    return 'UiStat(name: $name, value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UiStat &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UiStatCopyWith<_$_UiStat> get copyWith =>
      __$$_UiStatCopyWithImpl<_$_UiStat>(this, _$identity);
}

abstract class _UiStat implements UiStat {
  factory _UiStat({required final String name, required final int value}) =
      _$_UiStat;

  @override
  String get name;
  @override
  int get value;
  @override
  @JsonKey(ignore: true)
  _$$_UiStatCopyWith<_$_UiStat> get copyWith =>
      throw _privateConstructorUsedError;
}
