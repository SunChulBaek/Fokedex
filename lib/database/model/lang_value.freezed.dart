// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lang_value.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LangValue _$LangValueFromJson(Map<String, dynamic> json) {
  return _LangValue.fromJson(json);
}

/// @nodoc
mixin _$LangValue {
  @JsonKey(name: "lang")
  String get lang => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  String get value => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LangValueCopyWith<LangValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LangValueCopyWith<$Res> {
  factory $LangValueCopyWith(LangValue value, $Res Function(LangValue) then) =
      _$LangValueCopyWithImpl<$Res, LangValue>;
  @useResult
  $Res call(
      {@JsonKey(name: "lang") String lang,
      @JsonKey(name: "value") String value});
}

/// @nodoc
class _$LangValueCopyWithImpl<$Res, $Val extends LangValue>
    implements $LangValueCopyWith<$Res> {
  _$LangValueCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LangValueImplCopyWith<$Res>
    implements $LangValueCopyWith<$Res> {
  factory _$$LangValueImplCopyWith(
          _$LangValueImpl value, $Res Function(_$LangValueImpl) then) =
      __$$LangValueImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "lang") String lang,
      @JsonKey(name: "value") String value});
}

/// @nodoc
class __$$LangValueImplCopyWithImpl<$Res>
    extends _$LangValueCopyWithImpl<$Res, _$LangValueImpl>
    implements _$$LangValueImplCopyWith<$Res> {
  __$$LangValueImplCopyWithImpl(
      _$LangValueImpl _value, $Res Function(_$LangValueImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
    Object? value = null,
  }) {
    return _then(_$LangValueImpl(
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LangValueImpl implements _LangValue {
  _$LangValueImpl(
      {@JsonKey(name: "lang") required this.lang,
      @JsonKey(name: "value") required this.value});

  factory _$LangValueImpl.fromJson(Map<String, dynamic> json) =>
      _$$LangValueImplFromJson(json);

  @override
  @JsonKey(name: "lang")
  final String lang;
  @override
  @JsonKey(name: "value")
  final String value;

  @override
  String toString() {
    return 'LangValue(lang: $lang, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LangValueImpl &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lang, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LangValueImplCopyWith<_$LangValueImpl> get copyWith =>
      __$$LangValueImplCopyWithImpl<_$LangValueImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LangValueImplToJson(
      this,
    );
  }
}

abstract class _LangValue implements LangValue {
  factory _LangValue(
      {@JsonKey(name: "lang") required final String lang,
      @JsonKey(name: "value") required final String value}) = _$LangValueImpl;

  factory _LangValue.fromJson(Map<String, dynamic> json) =
      _$LangValueImpl.fromJson;

  @override
  @JsonKey(name: "lang")
  String get lang;
  @override
  @JsonKey(name: "value")
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$LangValueImplCopyWith<_$LangValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
