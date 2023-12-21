// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_api_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkAPIResource {
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkAPIResourceCopyWith<NetworkAPIResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkAPIResourceCopyWith<$Res> {
  factory $NetworkAPIResourceCopyWith(
          NetworkAPIResource value, $Res Function(NetworkAPIResource) then) =
      _$NetworkAPIResourceCopyWithImpl<$Res, NetworkAPIResource>;
  @useResult
  $Res call({@JsonKey(name: 'url') String url});
}

/// @nodoc
class _$NetworkAPIResourceCopyWithImpl<$Res, $Val extends NetworkAPIResource>
    implements $NetworkAPIResourceCopyWith<$Res> {
  _$NetworkAPIResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkAPIResourceImplCopyWith<$Res>
    implements $NetworkAPIResourceCopyWith<$Res> {
  factory _$$NetworkAPIResourceImplCopyWith(_$NetworkAPIResourceImpl value,
          $Res Function(_$NetworkAPIResourceImpl) then) =
      __$$NetworkAPIResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'url') String url});
}

/// @nodoc
class __$$NetworkAPIResourceImplCopyWithImpl<$Res>
    extends _$NetworkAPIResourceCopyWithImpl<$Res, _$NetworkAPIResourceImpl>
    implements _$$NetworkAPIResourceImplCopyWith<$Res> {
  __$$NetworkAPIResourceImplCopyWithImpl(_$NetworkAPIResourceImpl _value,
      $Res Function(_$NetworkAPIResourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$NetworkAPIResourceImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NetworkAPIResourceImpl implements _NetworkAPIResource {
  _$NetworkAPIResourceImpl({@JsonKey(name: 'url') required this.url});

  @override
  @JsonKey(name: 'url')
  final String url;

  @override
  String toString() {
    return 'NetworkAPIResource(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkAPIResourceImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkAPIResourceImplCopyWith<_$NetworkAPIResourceImpl> get copyWith =>
      __$$NetworkAPIResourceImplCopyWithImpl<_$NetworkAPIResourceImpl>(
          this, _$identity);
}

abstract class _NetworkAPIResource implements NetworkAPIResource {
  factory _NetworkAPIResource(
          {@JsonKey(name: 'url') required final String url}) =
      _$NetworkAPIResourceImpl;

  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$NetworkAPIResourceImplCopyWith<_$NetworkAPIResourceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
