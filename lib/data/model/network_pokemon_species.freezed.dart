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
  @JsonKey(name: 'evolution_chain')
  NetworkAPIResource get evolutionChain => throw _privateConstructorUsedError;
  @JsonKey(name: 'varieties')
  List<NetworkPokemonSpeciesVariety> get varieties =>
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
          List<NetworkFlavorText> flavorTextEntries,
      @JsonKey(name: 'evolution_chain')
          NetworkAPIResource evolutionChain,
      @JsonKey(name: 'varieties')
          List<NetworkPokemonSpeciesVariety> varieties});

  $NetworkAPIResourceCopyWith<$Res> get evolutionChain;
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
    Object? evolutionChain = null,
    Object? varieties = null,
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
      evolutionChain: null == evolutionChain
          ? _value.evolutionChain
          : evolutionChain // ignore: cast_nullable_to_non_nullable
              as NetworkAPIResource,
      varieties: null == varieties
          ? _value.varieties
          : varieties // ignore: cast_nullable_to_non_nullable
              as List<NetworkPokemonSpeciesVariety>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkAPIResourceCopyWith<$Res> get evolutionChain {
    return $NetworkAPIResourceCopyWith<$Res>(_value.evolutionChain, (value) {
      return _then(_value.copyWith(evolutionChain: value) as $Val);
    });
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
          List<NetworkFlavorText> flavorTextEntries,
      @JsonKey(name: 'evolution_chain')
          NetworkAPIResource evolutionChain,
      @JsonKey(name: 'varieties')
          List<NetworkPokemonSpeciesVariety> varieties});

  @override
  $NetworkAPIResourceCopyWith<$Res> get evolutionChain;
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
    Object? evolutionChain = null,
    Object? varieties = null,
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
      evolutionChain: null == evolutionChain
          ? _value.evolutionChain
          : evolutionChain // ignore: cast_nullable_to_non_nullable
              as NetworkAPIResource,
      varieties: null == varieties
          ? _value._varieties
          : varieties // ignore: cast_nullable_to_non_nullable
              as List<NetworkPokemonSpeciesVariety>,
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
          required final List<NetworkFlavorText> flavorTextEntries,
      @JsonKey(name: 'evolution_chain')
          required this.evolutionChain,
      @JsonKey(name: 'varieties')
          required final List<NetworkPokemonSpeciesVariety> varieties})
      : _names = names,
        _flavorTextEntries = flavorTextEntries,
        _varieties = varieties;

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
  @JsonKey(name: 'evolution_chain')
  final NetworkAPIResource evolutionChain;
  final List<NetworkPokemonSpeciesVariety> _varieties;
  @override
  @JsonKey(name: 'varieties')
  List<NetworkPokemonSpeciesVariety> get varieties {
    if (_varieties is EqualUnmodifiableListView) return _varieties;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_varieties);
  }

  @override
  String toString() {
    return 'NetworkPokemonSpecies(id: $id, names: $names, flavorTextEntries: $flavorTextEntries, evolutionChain: $evolutionChain, varieties: $varieties)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkPokemonSpecies &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._names, _names) &&
            const DeepCollectionEquality()
                .equals(other._flavorTextEntries, _flavorTextEntries) &&
            (identical(other.evolutionChain, evolutionChain) ||
                other.evolutionChain == evolutionChain) &&
            const DeepCollectionEquality()
                .equals(other._varieties, _varieties));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      const DeepCollectionEquality().hash(_names),
      const DeepCollectionEquality().hash(_flavorTextEntries),
      evolutionChain,
      const DeepCollectionEquality().hash(_varieties));

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
              required final List<NetworkFlavorText> flavorTextEntries,
          @JsonKey(name: 'evolution_chain')
              required final NetworkAPIResource evolutionChain,
          @JsonKey(name: 'varieties')
              required final List<NetworkPokemonSpeciesVariety> varieties}) =
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
  @JsonKey(name: 'evolution_chain')
  NetworkAPIResource get evolutionChain;
  @override
  @JsonKey(name: 'varieties')
  List<NetworkPokemonSpeciesVariety> get varieties;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkPokemonSpeciesCopyWith<_$_NetworkPokemonSpecies> get copyWith =>
      throw _privateConstructorUsedError;
}
