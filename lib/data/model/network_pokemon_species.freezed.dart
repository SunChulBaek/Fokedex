// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_pokemon_species.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkPokemonSpecies {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkPokemonSpeciesCopyWith<NetworkPokemonSpecies> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkPokemonSpeciesCopyWith<$Res> {
  factory $NetworkPokemonSpeciesCopyWith(NetworkPokemonSpecies value,
          $Res Function(NetworkPokemonSpecies) then) =
      _$NetworkPokemonSpeciesCopyWithImpl<$Res, NetworkPokemonSpecies>;
  @useResult
  $Res call({@JsonKey(name: 'id') int id});
}

/// @nodoc
class _$NetworkPokemonSpeciesCopyWithImpl<$Res,
        $Val extends NetworkPokemonSpecies>
    implements $NetworkPokemonSpeciesCopyWith<$Res> {
  _$NetworkPokemonSpeciesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NetworkPokemonSpeciesCopyWith<$Res>
    implements $NetworkPokemonSpeciesCopyWith<$Res> {
  factory _$$_NetworkPokemonSpeciesCopyWith(_$_NetworkPokemonSpecies value,
          $Res Function(_$_NetworkPokemonSpecies) then) =
      __$$_NetworkPokemonSpeciesCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'id') int id});
}

/// @nodoc
class __$$_NetworkPokemonSpeciesCopyWithImpl<$Res>
    extends _$NetworkPokemonSpeciesCopyWithImpl<$Res, _$_NetworkPokemonSpecies>
    implements _$$_NetworkPokemonSpeciesCopyWith<$Res> {
  __$$_NetworkPokemonSpeciesCopyWithImpl(_$_NetworkPokemonSpecies _value,
      $Res Function(_$_NetworkPokemonSpecies) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_NetworkPokemonSpecies(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_NetworkPokemonSpecies implements _NetworkPokemonSpecies {
  _$_NetworkPokemonSpecies({@JsonKey(name: 'id') required this.id});

  @override
  @JsonKey(name: 'id')
  final int id;

  @override
  String toString() {
    return 'NetworkPokemonSpecies(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkPokemonSpecies &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkPokemonSpeciesCopyWith<_$_NetworkPokemonSpecies> get copyWith =>
      __$$_NetworkPokemonSpeciesCopyWithImpl<_$_NetworkPokemonSpecies>(
          this, _$identity);
}

abstract class _NetworkPokemonSpecies implements NetworkPokemonSpecies {
  factory _NetworkPokemonSpecies({@JsonKey(name: 'id') required final int id}) =
      _$_NetworkPokemonSpecies;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkPokemonSpeciesCopyWith<_$_NetworkPokemonSpecies> get copyWith =>
      throw _privateConstructorUsedError;
}
