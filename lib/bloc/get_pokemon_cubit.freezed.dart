// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_pokemon_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PokemonData {
  int get number => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonDataCopyWith<PokemonData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonDataCopyWith<$Res> {
  factory $PokemonDataCopyWith(
          PokemonData value, $Res Function(PokemonData) then) =
      _$PokemonDataCopyWithImpl<$Res, PokemonData>;
  @useResult
  $Res call({int number});
}

/// @nodoc
class _$PokemonDataCopyWithImpl<$Res, $Val extends PokemonData>
    implements $PokemonDataCopyWith<$Res> {
  _$PokemonDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PokemonDataCopyWith<$Res>
    implements $PokemonDataCopyWith<$Res> {
  factory _$$_PokemonDataCopyWith(
          _$_PokemonData value, $Res Function(_$_PokemonData) then) =
      __$$_PokemonDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int number});
}

/// @nodoc
class __$$_PokemonDataCopyWithImpl<$Res>
    extends _$PokemonDataCopyWithImpl<$Res, _$_PokemonData>
    implements _$$_PokemonDataCopyWith<$Res> {
  __$$_PokemonDataCopyWithImpl(
      _$_PokemonData _value, $Res Function(_$_PokemonData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
  }) {
    return _then(_$_PokemonData(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PokemonData implements _PokemonData {
  _$_PokemonData({required this.number});

  @override
  final int number;

  @override
  String toString() {
    return 'PokemonData(number: $number)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PokemonData &&
            (identical(other.number, number) || other.number == number));
  }

  @override
  int get hashCode => Object.hash(runtimeType, number);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PokemonDataCopyWith<_$_PokemonData> get copyWith =>
      __$$_PokemonDataCopyWithImpl<_$_PokemonData>(this, _$identity);
}

abstract class _PokemonData implements PokemonData {
  factory _PokemonData({required final int number}) = _$_PokemonData;

  @override
  int get number;
  @override
  @JsonKey(ignore: true)
  _$$_PokemonDataCopyWith<_$_PokemonData> get copyWith =>
      throw _privateConstructorUsedError;
}
