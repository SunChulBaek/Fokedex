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
  @JsonKey(name: 'names')
  List<NetworkName> get names => throw _privateConstructorUsedError;
  @JsonKey(name: 'flavor_text_entries')
  List<NetworkFlavorText> get flavorTextEntries =>
      throw _privateConstructorUsedError;

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
  $Res call(
      {@JsonKey(name: 'id')
          int id,
      @JsonKey(name: 'names')
          List<NetworkName> names,
      @JsonKey(name: 'flavor_text_entries')
          List<NetworkFlavorText> flavorTextEntries});
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
    Object? names = null,
    Object? flavorTextEntries = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      names: null == names
          ? _value.names
          : names // ignore: cast_nullable_to_non_nullable
              as List<NetworkName>,
      flavorTextEntries: null == flavorTextEntries
          ? _value.flavorTextEntries
          : flavorTextEntries // ignore: cast_nullable_to_non_nullable
              as List<NetworkFlavorText>,
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
  $Res call(
      {@JsonKey(name: 'id')
          int id,
      @JsonKey(name: 'names')
          List<NetworkName> names,
      @JsonKey(name: 'flavor_text_entries')
          List<NetworkFlavorText> flavorTextEntries});
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
    Object? names = null,
    Object? flavorTextEntries = null,
  }) {
    return _then(_$_NetworkPokemonSpecies(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      names: null == names
          ? _value._names
          : names // ignore: cast_nullable_to_non_nullable
              as List<NetworkName>,
      flavorTextEntries: null == flavorTextEntries
          ? _value._flavorTextEntries
          : flavorTextEntries // ignore: cast_nullable_to_non_nullable
              as List<NetworkFlavorText>,
    ));
  }
}

/// @nodoc

class _$_NetworkPokemonSpecies implements _NetworkPokemonSpecies {
  _$_NetworkPokemonSpecies(
      {@JsonKey(name: 'id')
          required this.id,
      @JsonKey(name: 'names')
          required final List<NetworkName> names,
      @JsonKey(name: 'flavor_text_entries')
          required final List<NetworkFlavorText> flavorTextEntries})
      : _names = names,
        _flavorTextEntries = flavorTextEntries;

  @override
  @JsonKey(name: 'id')
  final int id;
  final List<NetworkName> _names;
  @override
  @JsonKey(name: 'names')
  List<NetworkName> get names {
    if (_names is EqualUnmodifiableListView) return _names;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_names);
  }

  final List<NetworkFlavorText> _flavorTextEntries;
  @override
  @JsonKey(name: 'flavor_text_entries')
  List<NetworkFlavorText> get flavorTextEntries {
    if (_flavorTextEntries is EqualUnmodifiableListView)
      return _flavorTextEntries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flavorTextEntries);
  }

  @override
  String toString() {
    return 'NetworkPokemonSpecies(id: $id, names: $names, flavorTextEntries: $flavorTextEntries)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkPokemonSpecies &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._names, _names) &&
            const DeepCollectionEquality()
                .equals(other._flavorTextEntries, _flavorTextEntries));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_names),
      const DeepCollectionEquality().hash(_flavorTextEntries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkPokemonSpeciesCopyWith<_$_NetworkPokemonSpecies> get copyWith =>
      __$$_NetworkPokemonSpeciesCopyWithImpl<_$_NetworkPokemonSpecies>(
          this, _$identity);
}

abstract class _NetworkPokemonSpecies implements NetworkPokemonSpecies {
  factory _NetworkPokemonSpecies(
          {@JsonKey(name: 'id')
              required final int id,
          @JsonKey(name: 'names')
              required final List<NetworkName> names,
          @JsonKey(name: 'flavor_text_entries')
              required final List<NetworkFlavorText> flavorTextEntries}) =
      _$_NetworkPokemonSpecies;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'names')
  List<NetworkName> get names;
  @override
  @JsonKey(name: 'flavor_text_entries')
  List<NetworkFlavorText> get flavorTextEntries;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkPokemonSpeciesCopyWith<_$_NetworkPokemonSpecies> get copyWith =>
      throw _privateConstructorUsedError;
}
