// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_pokemon_species_variety.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkPokemonSpeciesVariety {
  @JsonKey(name: 'is_default')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'pokemon')
  NetworkNamedAPIResource get pokemon => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkPokemonSpeciesVarietyCopyWith<NetworkPokemonSpeciesVariety>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkPokemonSpeciesVarietyCopyWith<$Res> {
  factory $NetworkPokemonSpeciesVarietyCopyWith(
          NetworkPokemonSpeciesVariety value,
          $Res Function(NetworkPokemonSpeciesVariety) then) =
      _$NetworkPokemonSpeciesVarietyCopyWithImpl<$Res,
          NetworkPokemonSpeciesVariety>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'pokemon') NetworkNamedAPIResource pokemon});

  $NetworkNamedAPIResourceCopyWith<$Res> get pokemon;
}

/// @nodoc
class _$NetworkPokemonSpeciesVarietyCopyWithImpl<$Res,
        $Val extends NetworkPokemonSpeciesVariety>
    implements $NetworkPokemonSpeciesVarietyCopyWith<$Res> {
  _$NetworkPokemonSpeciesVarietyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDefault = null,
    Object? pokemon = null,
  }) {
    return _then(_value.copyWith(
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      pokemon: null == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkNamedAPIResourceCopyWith<$Res> get pokemon {
    return $NetworkNamedAPIResourceCopyWith<$Res>(_value.pokemon, (value) {
      return _then(_value.copyWith(pokemon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NetworkPokemonSpeciesVarietyImplCopyWith<$Res>
    implements $NetworkPokemonSpeciesVarietyCopyWith<$Res> {
  factory _$$NetworkPokemonSpeciesVarietyImplCopyWith(
          _$NetworkPokemonSpeciesVarietyImpl value,
          $Res Function(_$NetworkPokemonSpeciesVarietyImpl) then) =
      __$$NetworkPokemonSpeciesVarietyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'pokemon') NetworkNamedAPIResource pokemon});

  @override
  $NetworkNamedAPIResourceCopyWith<$Res> get pokemon;
}

/// @nodoc
class __$$NetworkPokemonSpeciesVarietyImplCopyWithImpl<$Res>
    extends _$NetworkPokemonSpeciesVarietyCopyWithImpl<$Res,
        _$NetworkPokemonSpeciesVarietyImpl>
    implements _$$NetworkPokemonSpeciesVarietyImplCopyWith<$Res> {
  __$$NetworkPokemonSpeciesVarietyImplCopyWithImpl(
      _$NetworkPokemonSpeciesVarietyImpl _value,
      $Res Function(_$NetworkPokemonSpeciesVarietyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDefault = null,
    Object? pokemon = null,
  }) {
    return _then(_$NetworkPokemonSpeciesVarietyImpl(
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      pokemon: null == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ));
  }
}

/// @nodoc

class _$NetworkPokemonSpeciesVarietyImpl
    implements _NetworkPokemonSpeciesVariety {
  _$NetworkPokemonSpeciesVarietyImpl(
      {@JsonKey(name: 'is_default') required this.isDefault,
      @JsonKey(name: 'pokemon') required this.pokemon});

  @override
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @override
  @JsonKey(name: 'pokemon')
  final NetworkNamedAPIResource pokemon;

  @override
  String toString() {
    return 'NetworkPokemonSpeciesVariety(isDefault: $isDefault, pokemon: $pokemon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkPokemonSpeciesVarietyImpl &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDefault, pokemon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkPokemonSpeciesVarietyImplCopyWith<
          _$NetworkPokemonSpeciesVarietyImpl>
      get copyWith => __$$NetworkPokemonSpeciesVarietyImplCopyWithImpl<
          _$NetworkPokemonSpeciesVarietyImpl>(this, _$identity);
}

abstract class _NetworkPokemonSpeciesVariety
    implements NetworkPokemonSpeciesVariety {
  factory _NetworkPokemonSpeciesVariety(
          {@JsonKey(name: 'is_default') required final bool isDefault,
          @JsonKey(name: 'pokemon')
          required final NetworkNamedAPIResource pokemon}) =
      _$NetworkPokemonSpeciesVarietyImpl;

  @override
  @JsonKey(name: 'is_default')
  bool get isDefault;
  @override
  @JsonKey(name: 'pokemon')
  NetworkNamedAPIResource get pokemon;
  @override
  @JsonKey(ignore: true)
  _$$NetworkPokemonSpeciesVarietyImplCopyWith<
          _$NetworkPokemonSpeciesVarietyImpl>
      get copyWith => throw _privateConstructorUsedError;
}
