// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkType _$NetworkTypeFromJson(Map<String, dynamic> json) {
  return _NetworkType.fromJson(json);
}

/// @nodoc
mixin _$NetworkType {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'names')
  List<NetworkName> get names => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkTypeCopyWith<NetworkType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkTypeCopyWith<$Res> {
  factory $NetworkTypeCopyWith(
          NetworkType value, $Res Function(NetworkType) then) =
      _$NetworkTypeCopyWithImpl<$Res, NetworkType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'names') List<NetworkName> names});
}

/// @nodoc
class _$NetworkTypeCopyWithImpl<$Res, $Val extends NetworkType>
    implements $NetworkTypeCopyWith<$Res> {
  _$NetworkTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? names = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      names: null == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as List<NetworkName>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkTypeImplCopyWith<$Res>
    implements $NetworkTypeCopyWith<$Res> {
  factory _$$NetworkTypeImplCopyWith(
          _$NetworkTypeImpl value, $Res Function(_$NetworkTypeImpl) then) =
      __$$NetworkTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'names') List<NetworkName> names});
}

/// @nodoc
class __$$NetworkTypeImplCopyWithImpl<$Res>
    extends _$NetworkTypeCopyWithImpl<$Res, _$NetworkTypeImpl>
    implements _$$NetworkTypeImplCopyWith<$Res> {
  __$$NetworkTypeImplCopyWithImpl(
      _$NetworkTypeImpl _value, $Res Function(_$NetworkTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? names = null,
  }) {
    return _then(_$NetworkTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      names: null == names
          ? _value._names
          : names // ignore: cast_nullable_to_non_nullable
              as List<NetworkName>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkTypeImpl implements _NetworkType {
  _$NetworkTypeImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'names') required final List<NetworkName> names})
      : _names = names;

  factory _$NetworkTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkTypeImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  final List<NetworkName> _names;
  @override
  @JsonKey(name: 'names')
  List<NetworkName> get names {
    if (_names is EqualUnmodifiableListView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_names);
  }

  @override
  String toString() {
    return 'NetworkType(id: $id, name: $name, names: $names)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._names, _names));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, const DeepCollectionEquality().hash(_names));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkTypeImplCopyWith<_$NetworkTypeImpl> get copyWith =>
      __$$NetworkTypeImplCopyWithImpl<_$NetworkTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkTypeImplToJson(
      this,
    );
  }
}

abstract class _NetworkType implements NetworkType {
  factory _NetworkType(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'name') required final String name,
          @JsonKey(name: 'names') required final List<NetworkName> names}) =
      _$NetworkTypeImpl;

  factory _NetworkType.fromJson(Map<String, dynamic> json) =
      _$NetworkTypeImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'names')
  List<NetworkName> get names;
  @override
  @JsonKey(ignore: true)
  _$$NetworkTypeImplCopyWith<_$NetworkTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
