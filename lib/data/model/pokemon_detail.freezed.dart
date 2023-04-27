// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PokemonDetail {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_experience')
  int get baseExp => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  int get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight')
  int get weight => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonDetailCopyWith<PokemonDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDetailCopyWith<$Res> {
  factory $PokemonDetailCopyWith(
          PokemonDetail value, $Res Function(PokemonDetail) then) =
      _$PokemonDetailCopyWithImpl<$Res, PokemonDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'base_experience') int baseExp,
      @JsonKey(name: 'height') int height,
      @JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'order') int order,
      @JsonKey(name: 'weight') int weight});
}

/// @nodoc
class _$PokemonDetailCopyWithImpl<$Res, $Val extends PokemonDetail>
    implements $PokemonDetailCopyWith<$Res> {
  _$PokemonDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseExp = null,
    Object? height = null,
    Object? isDefault = null,
    Object? order = null,
    Object? weight = null,
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
      baseExp: null == baseExp
          ? _value.baseExp
          : baseExp // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokemonDetailCopyWith<$Res>
    implements $PokemonDetailCopyWith<$Res> {
  factory _$$_PokemonDetailCopyWith(
          _$_PokemonDetail value, $Res Function(_$_PokemonDetail) then) =
      __$$_PokemonDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'base_experience') int baseExp,
      @JsonKey(name: 'height') int height,
      @JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'order') int order,
      @JsonKey(name: 'weight') int weight});
}

/// @nodoc
class __$$_PokemonDetailCopyWithImpl<$Res>
    extends _$PokemonDetailCopyWithImpl<$Res, _$_PokemonDetail>
    implements _$$_PokemonDetailCopyWith<$Res> {
  __$$_PokemonDetailCopyWithImpl(
      _$_PokemonDetail _value, $Res Function(_$_PokemonDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseExp = null,
    Object? height = null,
    Object? isDefault = null,
    Object? order = null,
    Object? weight = null,
  }) {
    return _then(_$_PokemonDetail(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseExp: null == baseExp
          ? _value.baseExp
          : baseExp // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PokemonDetail implements _PokemonDetail {
  _$_PokemonDetail(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'base_experience') required this.baseExp,
      @JsonKey(name: 'height') required this.height,
      @JsonKey(name: 'is_default') required this.isDefault,
      @JsonKey(name: 'order') required this.order,
      @JsonKey(name: 'weight') required this.weight});

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'base_experience')
  final int baseExp;
  @override
  @JsonKey(name: 'height')
  final int height;
  @override
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @override
  @JsonKey(name: 'order')
  final int order;
  @override
  @JsonKey(name: 'weight')
  final int weight;

  @override
  String toString() {
    return 'PokemonDetail(id: $id, name: $name, baseExp: $baseExp, height: $height, isDefault: $isDefault, order: $order, weight: $weight)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baseExp, baseExp) || other.baseExp == baseExp) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, baseExp, height, isDefault, order, weight);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonDetailCopyWith<_$_PokemonDetail> get copyWith =>
      __$$_PokemonDetailCopyWithImpl<_$_PokemonDetail>(this, _$identity);
}

abstract class _PokemonDetail implements PokemonDetail {
  factory _PokemonDetail(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'base_experience') required final int baseExp,
      @JsonKey(name: 'height') required final int height,
      @JsonKey(name: 'is_default') required final bool isDefault,
      @JsonKey(name: 'order') required final int order,
      @JsonKey(name: 'weight') required final int weight}) = _$_PokemonDetail;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'base_experience')
  int get baseExp;
  @override
  @JsonKey(name: 'height')
  int get height;
  @override
  @JsonKey(name: 'is_default')
  bool get isDefault;
  @override
  @JsonKey(name: 'order')
  int get order;
  @override
  @JsonKey(name: 'weight')
  int get weight;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonDetailCopyWith<_$_PokemonDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
