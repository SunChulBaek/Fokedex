// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_named_api_resource.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkNamedAPIResource _$NetworkNamedAPIResourceFromJson(
    Map<String, dynamic> json) {
  return _NetworkNamedAPIResource.fromJson(json);
}

/// @nodoc
mixin _$NetworkNamedAPIResource {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkNamedAPIResourceCopyWith<NetworkNamedAPIResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkNamedAPIResourceCopyWith<$Res> {
  factory $NetworkNamedAPIResourceCopyWith(NetworkNamedAPIResource value,
          $Res Function(NetworkNamedAPIResource) then) =
      _$NetworkNamedAPIResourceCopyWithImpl<$Res, NetworkNamedAPIResource>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name, @JsonKey(name: 'url') String url});
}

/// @nodoc
class _$NetworkNamedAPIResourceCopyWithImpl<$Res,
        $Val extends NetworkNamedAPIResource>
    implements $NetworkNamedAPIResourceCopyWith<$Res> {
  _$NetworkNamedAPIResourceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkNamedAPIResourceImplCopyWith<$Res>
    implements $NetworkNamedAPIResourceCopyWith<$Res> {
  factory _$$NetworkNamedAPIResourceImplCopyWith(
          _$NetworkNamedAPIResourceImpl value,
          $Res Function(_$NetworkNamedAPIResourceImpl) then) =
      __$$NetworkNamedAPIResourceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String name, @JsonKey(name: 'url') String url});
}

/// @nodoc
class __$$NetworkNamedAPIResourceImplCopyWithImpl<$Res>
    extends _$NetworkNamedAPIResourceCopyWithImpl<$Res,
        _$NetworkNamedAPIResourceImpl>
    implements _$$NetworkNamedAPIResourceImplCopyWith<$Res> {
  __$$NetworkNamedAPIResourceImplCopyWithImpl(
      _$NetworkNamedAPIResourceImpl _value,
      $Res Function(_$NetworkNamedAPIResourceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? url = null,
  }) {
    return _then(_$NetworkNamedAPIResourceImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkNamedAPIResourceImpl implements _NetworkNamedAPIResource {
  _$NetworkNamedAPIResourceImpl(
      {@JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'url') required this.url});

  factory _$NetworkNamedAPIResourceImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkNamedAPIResourceImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'url')
  final String url;

  @override
  String toString() {
    return 'NetworkNamedAPIResource(name: $name, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkNamedAPIResourceImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkNamedAPIResourceImplCopyWith<_$NetworkNamedAPIResourceImpl>
      get copyWith => __$$NetworkNamedAPIResourceImplCopyWithImpl<
          _$NetworkNamedAPIResourceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkNamedAPIResourceImplToJson(
      this,
    );
  }
}

abstract class _NetworkNamedAPIResource implements NetworkNamedAPIResource {
  factory _NetworkNamedAPIResource(
          {@JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'url') required final String url}) =
      _$NetworkNamedAPIResourceImpl;

  factory _NetworkNamedAPIResource.fromJson(Map<String, dynamic> json) =
      _$NetworkNamedAPIResourceImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'url')
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$NetworkNamedAPIResourceImplCopyWith<_$NetworkNamedAPIResourceImpl>
      get copyWith => throw _privateConstructorUsedError;
}
