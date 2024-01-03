// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_chain_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkChainLink _$NetworkChainLinkFromJson(Map<String, dynamic> json) {
  return _NetworkChainLink.fromJson(json);
}

/// @nodoc
mixin _$NetworkChainLink {
  @JsonKey(name: 'is_baby')
  bool get isBaby => throw _privateConstructorUsedError;
  @JsonKey(name: 'species')
  NetworkNamedAPIResource get species => throw _privateConstructorUsedError;
  @JsonKey(name: 'evolution_details')
  List<NetworkEvolutionDetail> get evolutionDetails =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'evolves_to')
  List<NetworkChainLink> get evolvesTo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkChainLinkCopyWith<NetworkChainLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkChainLinkCopyWith<$Res> {
  factory $NetworkChainLinkCopyWith(
          NetworkChainLink value, $Res Function(NetworkChainLink) then) =
      _$NetworkChainLinkCopyWithImpl<$Res, NetworkChainLink>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_baby') bool isBaby,
      @JsonKey(name: 'species') NetworkNamedAPIResource species,
      @JsonKey(name: 'evolution_details')
      List<NetworkEvolutionDetail> evolutionDetails,
      @JsonKey(name: 'evolves_to') List<NetworkChainLink> evolvesTo});

  $NetworkNamedAPIResourceCopyWith<$Res> get species;
}

/// @nodoc
class _$NetworkChainLinkCopyWithImpl<$Res, $Val extends NetworkChainLink>
    implements $NetworkChainLinkCopyWith<$Res> {
  _$NetworkChainLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBaby = null,
    Object? species = null,
    Object? evolutionDetails = null,
    Object? evolvesTo = null,
  }) {
    return _then(_value.copyWith(
      isBaby: null == isBaby
          ? _value.isBaby
          : isBaby // ignore: cast_nullable_to_non_nullable
              as bool,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
      evolutionDetails: null == evolutionDetails
          ? _value.evolutionDetails
          : evolutionDetails // ignore: cast_nullable_to_non_nullable
              as List<NetworkEvolutionDetail>,
      evolvesTo: null == evolvesTo
          ? _value.evolvesTo
          : evolvesTo // ignore: cast_nullable_to_non_nullable
              as List<NetworkChainLink>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkNamedAPIResourceCopyWith<$Res> get species {
    return $NetworkNamedAPIResourceCopyWith<$Res>(_value.species, (value) {
      return _then(_value.copyWith(species: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NetworkChainLinkImplCopyWith<$Res>
    implements $NetworkChainLinkCopyWith<$Res> {
  factory _$$NetworkChainLinkImplCopyWith(_$NetworkChainLinkImpl value,
          $Res Function(_$NetworkChainLinkImpl) then) =
      __$$NetworkChainLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_baby') bool isBaby,
      @JsonKey(name: 'species') NetworkNamedAPIResource species,
      @JsonKey(name: 'evolution_details')
      List<NetworkEvolutionDetail> evolutionDetails,
      @JsonKey(name: 'evolves_to') List<NetworkChainLink> evolvesTo});

  @override
  $NetworkNamedAPIResourceCopyWith<$Res> get species;
}

/// @nodoc
class __$$NetworkChainLinkImplCopyWithImpl<$Res>
    extends _$NetworkChainLinkCopyWithImpl<$Res, _$NetworkChainLinkImpl>
    implements _$$NetworkChainLinkImplCopyWith<$Res> {
  __$$NetworkChainLinkImplCopyWithImpl(_$NetworkChainLinkImpl _value,
      $Res Function(_$NetworkChainLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isBaby = null,
    Object? species = null,
    Object? evolutionDetails = null,
    Object? evolvesTo = null,
  }) {
    return _then(_$NetworkChainLinkImpl(
      isBaby: null == isBaby
          ? _value.isBaby
          : isBaby // ignore: cast_nullable_to_non_nullable
              as bool,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
      evolutionDetails: null == evolutionDetails
          ? _value._evolutionDetails
          : evolutionDetails // ignore: cast_nullable_to_non_nullable
              as List<NetworkEvolutionDetail>,
      evolvesTo: null == evolvesTo
          ? _value._evolvesTo
          : evolvesTo // ignore: cast_nullable_to_non_nullable
              as List<NetworkChainLink>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkChainLinkImpl implements _NetworkChainLink {
  _$NetworkChainLinkImpl(
      {@JsonKey(name: 'is_baby') required this.isBaby,
      @JsonKey(name: 'species') required this.species,
      @JsonKey(name: 'evolution_details')
      required final List<NetworkEvolutionDetail> evolutionDetails,
      @JsonKey(name: 'evolves_to')
      required final List<NetworkChainLink> evolvesTo})
      : _evolutionDetails = evolutionDetails,
        _evolvesTo = evolvesTo;

  factory _$NetworkChainLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkChainLinkImplFromJson(json);

  @override
  @JsonKey(name: 'is_baby')
  final bool isBaby;
  @override
  @JsonKey(name: 'species')
  final NetworkNamedAPIResource species;
  final List<NetworkEvolutionDetail> _evolutionDetails;
  @override
  @JsonKey(name: 'evolution_details')
  List<NetworkEvolutionDetail> get evolutionDetails {
    if (_evolutionDetails is EqualUnmodifiableListView)
      return _evolutionDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evolutionDetails);
  }

  final List<NetworkChainLink> _evolvesTo;
  @override
  @JsonKey(name: 'evolves_to')
  List<NetworkChainLink> get evolvesTo {
    if (_evolvesTo is EqualUnmodifiableListView) return _evolvesTo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_evolvesTo);
  }

  @override
  String toString() {
    return 'NetworkChainLink(isBaby: $isBaby, species: $species, evolutionDetails: $evolutionDetails, evolvesTo: $evolvesTo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkChainLinkImpl &&
            (identical(other.isBaby, isBaby) || other.isBaby == isBaby) &&
            (identical(other.species, species) || other.species == species) &&
            const DeepCollectionEquality()
                .equals(other._evolutionDetails, _evolutionDetails) &&
            const DeepCollectionEquality()
                .equals(other._evolvesTo, _evolvesTo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      isBaby,
      species,
      const DeepCollectionEquality().hash(_evolutionDetails),
      const DeepCollectionEquality().hash(_evolvesTo));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkChainLinkImplCopyWith<_$NetworkChainLinkImpl> get copyWith =>
      __$$NetworkChainLinkImplCopyWithImpl<_$NetworkChainLinkImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkChainLinkImplToJson(
      this,
    );
  }
}

abstract class _NetworkChainLink implements NetworkChainLink {
  factory _NetworkChainLink(
      {@JsonKey(name: 'is_baby') required final bool isBaby,
      @JsonKey(name: 'species') required final NetworkNamedAPIResource species,
      @JsonKey(name: 'evolution_details')
      required final List<NetworkEvolutionDetail> evolutionDetails,
      @JsonKey(name: 'evolves_to')
      required final List<NetworkChainLink>
          evolvesTo}) = _$NetworkChainLinkImpl;

  factory _NetworkChainLink.fromJson(Map<String, dynamic> json) =
      _$NetworkChainLinkImpl.fromJson;

  @override
  @JsonKey(name: 'is_baby')
  bool get isBaby;
  @override
  @JsonKey(name: 'species')
  NetworkNamedAPIResource get species;
  @override
  @JsonKey(name: 'evolution_details')
  List<NetworkEvolutionDetail> get evolutionDetails;
  @override
  @JsonKey(name: 'evolves_to')
  List<NetworkChainLink> get evolvesTo;
  @override
  @JsonKey(ignore: true)
  _$$NetworkChainLinkImplCopyWith<_$NetworkChainLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
