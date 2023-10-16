// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_name.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkName {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'language')
  NetworkNamedAPIResource get language => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkNameCopyWith<NetworkName> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkNameCopyWith<$Res> {
  factory $NetworkNameCopyWith(
          NetworkName value, $Res Function(NetworkName) then) =
      _$NetworkNameCopyWithImpl<$Res, NetworkName>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'language') NetworkNamedAPIResource language});

  $NetworkNamedAPIResourceCopyWith<$Res> get language;
}

/// @nodoc
class _$NetworkNameCopyWithImpl<$Res, $Val extends NetworkName>
    implements $NetworkNameCopyWith<$Res> {
  _$NetworkNameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? language = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkNamedAPIResourceCopyWith<$Res> get language {
    return $NetworkNamedAPIResourceCopyWith<$Res>(_value.language, (value) {
      return _then(_value.copyWith(language: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NetworkNameImplCopyWith<$Res>
    implements $NetworkNameCopyWith<$Res> {
  factory _$$NetworkNameImplCopyWith(
          _$NetworkNameImpl value, $Res Function(_$NetworkNameImpl) then) =
      __$$NetworkNameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name,
      @JsonKey(name: 'language') NetworkNamedAPIResource language});

  @override
  $NetworkNamedAPIResourceCopyWith<$Res> get language;
}

/// @nodoc
class __$$NetworkNameImplCopyWithImpl<$Res>
    extends _$NetworkNameCopyWithImpl<$Res, _$NetworkNameImpl>
    implements _$$NetworkNameImplCopyWith<$Res> {
  __$$NetworkNameImplCopyWithImpl(
      _$NetworkNameImpl _value, $Res Function(_$NetworkNameImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? language = null,
  }) {
    return _then(_$NetworkNameImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ));
  }
}

/// @nodoc

class _$NetworkNameImpl implements _NetworkName {
  _$NetworkNameImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'language') required this.language});

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'language')
  final NetworkNamedAPIResource language;

  @override
  String toString() {
    return 'NetworkName(name: $name, language: $language)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkNameImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, language);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkNameImplCopyWith<_$NetworkNameImpl> get copyWith =>
      __$$NetworkNameImplCopyWithImpl<_$NetworkNameImpl>(this, _$identity);
}

abstract class _NetworkName implements NetworkName {
  factory _NetworkName(
      {@JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'language')
      required final NetworkNamedAPIResource language}) = _$NetworkNameImpl;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'language')
  NetworkNamedAPIResource get language;
  @override
  @JsonKey(ignore: true)
  _$$NetworkNameImplCopyWith<_$NetworkNameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
