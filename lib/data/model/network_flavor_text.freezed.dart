// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_flavor_text.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkFlavorText {
  @JsonKey(name: 'flavor_text')
  String get flavorText => throw _privateConstructorUsedError;
  @JsonKey(name: 'language')
  NetworkNamedAPIResource get language => throw _privateConstructorUsedError;
  @JsonKey(name: 'version')
  NetworkNamedAPIResource get version => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkFlavorTextCopyWith<NetworkFlavorText> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkFlavorTextCopyWith<$Res> {
  factory $NetworkFlavorTextCopyWith(
          NetworkFlavorText value, $Res Function(NetworkFlavorText) then) =
      _$NetworkFlavorTextCopyWithImpl<$Res, NetworkFlavorText>;
  @useResult
  $Res call(
      {@JsonKey(name: 'flavor_text') String flavorText,
      @JsonKey(name: 'language') NetworkNamedAPIResource language,
      @JsonKey(name: 'version') NetworkNamedAPIResource version});

  $NetworkNamedAPIResourceCopyWith<$Res> get language;
  $NetworkNamedAPIResourceCopyWith<$Res> get version;
}

/// @nodoc
class _$NetworkFlavorTextCopyWithImpl<$Res, $Val extends NetworkFlavorText>
    implements $NetworkFlavorTextCopyWith<$Res> {
  _$NetworkFlavorTextCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorText = null,
    Object? language = null,
    Object? version = null,
  }) {
    return _then(_value.copyWith(
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $NetworkNamedAPIResourceCopyWith<$Res> get version {
    return $NetworkNamedAPIResourceCopyWith<$Res>(_value.version, (value) {
      return _then(_value.copyWith(version: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NetworkFlavorTextCopyWith<$Res>
    implements $NetworkFlavorTextCopyWith<$Res> {
  factory _$$_NetworkFlavorTextCopyWith(_$_NetworkFlavorText value,
          $Res Function(_$_NetworkFlavorText) then) =
      __$$_NetworkFlavorTextCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'flavor_text') String flavorText,
      @JsonKey(name: 'language') NetworkNamedAPIResource language,
      @JsonKey(name: 'version') NetworkNamedAPIResource version});

  @override
  $NetworkNamedAPIResourceCopyWith<$Res> get language;
  @override
  $NetworkNamedAPIResourceCopyWith<$Res> get version;
}

/// @nodoc
class __$$_NetworkFlavorTextCopyWithImpl<$Res>
    extends _$NetworkFlavorTextCopyWithImpl<$Res, _$_NetworkFlavorText>
    implements _$$_NetworkFlavorTextCopyWith<$Res> {
  __$$_NetworkFlavorTextCopyWithImpl(
      _$_NetworkFlavorText _value, $Res Function(_$_NetworkFlavorText) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? flavorText = null,
    Object? language = null,
    Object? version = null,
  }) {
    return _then(_$_NetworkFlavorText(
      flavorText: null == flavorText
          ? _value.flavorText
          : flavorText // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ));
  }
}

/// @nodoc

class _$_NetworkFlavorText implements _NetworkFlavorText {
  _$_NetworkFlavorText(
      {@JsonKey(name: 'flavor_text') required this.flavorText,
      @JsonKey(name: 'language') required this.language,
      @JsonKey(name: 'version') required this.version});

  @override
  @JsonKey(name: 'flavor_text')
  final String flavorText;
  @override
  @JsonKey(name: 'language')
  final NetworkNamedAPIResource language;
  @override
  @JsonKey(name: 'version')
  final NetworkNamedAPIResource version;

  @override
  String toString() {
    return 'NetworkFlavorText(flavorText: $flavorText, language: $language, version: $version)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkFlavorText &&
            (identical(other.flavorText, flavorText) ||
                other.flavorText == flavorText) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.version, version) || other.version == version));
  }

  @override
  int get hashCode => Object.hash(runtimeType, flavorText, language, version);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkFlavorTextCopyWith<_$_NetworkFlavorText> get copyWith =>
      __$$_NetworkFlavorTextCopyWithImpl<_$_NetworkFlavorText>(
          this, _$identity);
}

abstract class _NetworkFlavorText implements NetworkFlavorText {
  factory _NetworkFlavorText(
          {@JsonKey(name: 'flavor_text')
              required final String flavorText,
          @JsonKey(name: 'language')
              required final NetworkNamedAPIResource language,
          @JsonKey(name: 'version')
              required final NetworkNamedAPIResource version}) =
      _$_NetworkFlavorText;

  @override
  @JsonKey(name: 'flavor_text')
  String get flavorText;
  @override
  @JsonKey(name: 'language')
  NetworkNamedAPIResource get language;
  @override
  @JsonKey(name: 'version')
  NetworkNamedAPIResource get version;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkFlavorTextCopyWith<_$_NetworkFlavorText> get copyWith =>
      throw _privateConstructorUsedError;
}
