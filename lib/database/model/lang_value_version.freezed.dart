// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lang_value_version.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LangValueVersion _$LangValueVersionFromJson(Map<String, dynamic> json) {
  return _LangValueVersion.fromJson(json);
}

/// @nodoc
mixin _$LangValueVersion {
  @JsonKey(name: "lang")
  String get lang => throw _privateConstructorUsedError;
  @JsonKey(name: "value")
  String get value => throw _privateConstructorUsedError;
  @JsonKey(name: "version")
  String get version => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LangValueVersionCopyWith<LangValueVersion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LangValueVersionCopyWith<$Res> {
  factory $LangValueVersionCopyWith(
          LangValueVersion value, $Res Function(LangValueVersion) then) =
      _$LangValueVersionCopyWithImpl<$Res, LangValueVersion>;
  @useResult
  $Res call(
      {@JsonKey(name: "lang") String lang,
      @JsonKey(name: "value") String value,
      @JsonKey(name: "version") String version});
}

/// @nodoc
class _$LangValueVersionCopyWithImpl<$Res, $Val extends LangValueVersion>
    implements $LangValueVersionCopyWith<$Res> {
  _$LangValueVersionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
    Object? value = null,
    Object? version = null,
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
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LangValueVersionImplCopyWith<$Res>
    implements $LangValueVersionCopyWith<$Res> {
  factory _$$LangValueVersionImplCopyWith(_$LangValueVersionImpl value,
          $Res Function(_$LangValueVersionImpl) then) =
      __$$LangValueVersionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "lang") String lang,
      @JsonKey(name: "value") String value,
      @JsonKey(name: "version") String version});
}

/// @nodoc
class __$$LangValueVersionImplCopyWithImpl<$Res>
    extends _$LangValueVersionCopyWithImpl<$Res, _$LangValueVersionImpl>
    implements _$$LangValueVersionImplCopyWith<$Res> {
  __$$LangValueVersionImplCopyWithImpl(_$LangValueVersionImpl _value,
      $Res Function(_$LangValueVersionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lang = null,
    Object? value = null,
    Object? version = null,
  }) {
    return _then(_$LangValueVersionImpl(
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LangValueVersionImpl implements _LangValueVersion {
  _$LangValueVersionImpl(
      {@JsonKey(name: "lang") required this.lang,
      @JsonKey(name: "value") required this.value,
      @JsonKey(name: "version") required this.version});

  factory _$LangValueVersionImpl.fromJson(Map<String, dynamic> json) =>
      _$$LangValueVersionImplFromJson(json);

  @override
  @JsonKey(name: "lang")
  final String lang;
  @override
  @JsonKey(name: "value")
  final String value;
  @override
  @JsonKey(name: "version")
  final String version;

  @override
  String toString() {
    return 'LangValueVersion(lang: $lang, value: $value, version: $version)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LangValueVersionImpl &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.version, version) || other.version == version));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, lang, value, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LangValueVersionImplCopyWith<_$LangValueVersionImpl> get copyWith =>
      __$$LangValueVersionImplCopyWithImpl<_$LangValueVersionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LangValueVersionImplToJson(
      this,
    );
  }
}

abstract class _LangValueVersion implements LangValueVersion {
  factory _LangValueVersion(
          {@JsonKey(name: "lang") required final String lang,
          @JsonKey(name: "value") required final String value,
          @JsonKey(name: "version") required final String version}) =
      _$LangValueVersionImpl;

  factory _LangValueVersion.fromJson(Map<String, dynamic> json) =
      _$LangValueVersionImpl.fromJson;

  @override
  @JsonKey(name: "lang")
  String get lang;
  @override
  @JsonKey(name: "value")
  String get value;
  @override
  @JsonKey(name: "version")
  String get version;
  @override
  @JsonKey(ignore: true)
  _$$LangValueVersionImplCopyWith<_$LangValueVersionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
