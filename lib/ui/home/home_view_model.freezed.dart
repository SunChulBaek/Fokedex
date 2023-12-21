// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PokemonListData {
  List<Pokemon> get pokemonList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PokemonListDataCopyWith<PokemonListData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PokemonListDataCopyWith<$Res> {
  factory $PokemonListDataCopyWith(
          PokemonListData value, $Res Function(PokemonListData) then) =
      _$PokemonListDataCopyWithImpl<$Res, PokemonListData>;
  @useResult
  $Res call({List<Pokemon> pokemonList});
}

/// @nodoc
class _$PokemonListDataCopyWithImpl<$Res, $Val extends PokemonListData>
    implements $PokemonListDataCopyWith<$Res> {
  _$PokemonListDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonList = null,
  }) {
    return _then(_value.copyWith(
      pokemonList: null == pokemonList
          ? _value.pokemonList
          : pokemonList // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PokemonListDataImplCopyWith<$Res>
    implements $PokemonListDataCopyWith<$Res> {
  factory _$$PokemonListDataImplCopyWith(_$PokemonListDataImpl value,
          $Res Function(_$PokemonListDataImpl) then) =
      __$$PokemonListDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Pokemon> pokemonList});
}

/// @nodoc
class __$$PokemonListDataImplCopyWithImpl<$Res>
    extends _$PokemonListDataCopyWithImpl<$Res, _$PokemonListDataImpl>
    implements _$$PokemonListDataImplCopyWith<$Res> {
  __$$PokemonListDataImplCopyWithImpl(
      _$PokemonListDataImpl _value, $Res Function(_$PokemonListDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemonList = null,
  }) {
    return _then(_$PokemonListDataImpl(
      pokemonList: null == pokemonList
          ? _value._pokemonList
          : pokemonList // ignore: cast_nullable_to_non_nullable
              as List<Pokemon>,
    ));
  }
}

/// @nodoc

class _$PokemonListDataImpl implements _PokemonListData {
  _$PokemonListDataImpl({required final List<Pokemon> pokemonList})
      : _pokemonList = pokemonList;

  final List<Pokemon> _pokemonList;
  @override
  List<Pokemon> get pokemonList {
    if (_pokemonList is EqualUnmodifiableListView) return _pokemonList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pokemonList);
  }

  @override
  String toString() {
    return 'PokemonListData(pokemonList: $pokemonList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PokemonListDataImpl &&
            const DeepCollectionEquality()
                .equals(other._pokemonList, _pokemonList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_pokemonList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PokemonListDataImplCopyWith<_$PokemonListDataImpl> get copyWith =>
      __$$PokemonListDataImplCopyWithImpl<_$PokemonListDataImpl>(
          this, _$identity);
}

abstract class _PokemonListData implements PokemonListData {
  factory _PokemonListData({required final List<Pokemon> pokemonList}) =
      _$PokemonListDataImpl;

  @override
  List<Pokemon> get pokemonList;
  @override
  @JsonKey(ignore: true)
  _$$PokemonListDataImplCopyWith<_$PokemonListDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
