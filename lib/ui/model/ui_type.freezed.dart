// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ui_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UiType {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UiTypeCopyWith<UiType> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiTypeCopyWith<$Res> {
  factory $UiTypeCopyWith(UiType value, $Res Function(UiType) then) =
      _$UiTypeCopyWithImpl<$Res, UiType>;
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class _$UiTypeCopyWithImpl<$Res, $Val extends UiType>
    implements $UiTypeCopyWith<$Res> {
  _$UiTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UiTypeImplCopyWith<$Res> implements $UiTypeCopyWith<$Res> {
  factory _$$UiTypeImplCopyWith(
          _$UiTypeImpl value, $Res Function(_$UiTypeImpl) then) =
      __$$UiTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name});
}

/// @nodoc
class __$$UiTypeImplCopyWithImpl<$Res>
    extends _$UiTypeCopyWithImpl<$Res, _$UiTypeImpl>
    implements _$$UiTypeImplCopyWith<$Res> {
  __$$UiTypeImplCopyWithImpl(
      _$UiTypeImpl _value, $Res Function(_$UiTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$UiTypeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UiTypeImpl implements _UiType {
  _$UiTypeImpl({required this.id, required this.name});

  @override
  final int id;
  @override
  final String name;

  @override
  String toString() {
    return 'UiType(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiTypeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UiTypeImplCopyWith<_$UiTypeImpl> get copyWith =>
      __$$UiTypeImplCopyWithImpl<_$UiTypeImpl>(this, _$identity);
}

abstract class _UiType implements UiType {
  factory _UiType({required final int id, required final String name}) =
      _$UiTypeImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$UiTypeImplCopyWith<_$UiTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
