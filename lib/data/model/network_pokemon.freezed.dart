// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_pokemon.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkPokemon _$NetworkPokemonFromJson(Map<String, dynamic> json) {
  return _NetworkPokemon.fromJson(json);
}

/// @nodoc
mixin _$NetworkPokemon {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_experience')
  int? get baseExp => throw _privateConstructorUsedError;
  @JsonKey(name: 'height')
  int? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_default')
  bool get isDefault => throw _privateConstructorUsedError;
  @JsonKey(name: 'order')
  int? get order => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight')
  int? get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'forms')
  List<NetworkNamedAPIResource> get forms => throw _privateConstructorUsedError;
  @JsonKey(name: 'types')
  List<NetworkPokemonType> get types => throw _privateConstructorUsedError;
  @JsonKey(name: 'stats')
  List<NetworkPokemonStat> get stats => throw _privateConstructorUsedError;
  @JsonKey(name: 'species')
  NetworkNamedAPIResource get species => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkPokemonCopyWith<NetworkPokemon> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkPokemonCopyWith<$Res> {
  factory $NetworkPokemonCopyWith(
          NetworkPokemon value, $Res Function(NetworkPokemon) then) =
      _$NetworkPokemonCopyWithImpl<$Res, NetworkPokemon>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'base_experience') int? baseExp,
      @JsonKey(name: 'height') int? height,
      @JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'order') int? order,
      @JsonKey(name: 'weight') int? weight,
      @JsonKey(name: 'forms') List<NetworkNamedAPIResource> forms,
      @JsonKey(name: 'types') List<NetworkPokemonType> types,
      @JsonKey(name: 'stats') List<NetworkPokemonStat> stats,
      @JsonKey(name: 'species') NetworkNamedAPIResource species});

  $NetworkNamedAPIResourceCopyWith<$Res> get species;
}

/// @nodoc
class _$NetworkPokemonCopyWithImpl<$Res, $Val extends NetworkPokemon>
    implements $NetworkPokemonCopyWith<$Res> {
  _$NetworkPokemonCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseExp = freezed,
    Object? height = freezed,
    Object? isDefault = null,
    Object? order = freezed,
    Object? weight = freezed,
    Object? forms = null,
    Object? types = null,
    Object? stats = null,
    Object? species = null,
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
      baseExp: freezed == baseExp
          ? _value.baseExp
          : baseExp // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      forms: null == forms
          ? _value.forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<NetworkNamedAPIResource>,
      types: null == types
          ? _value.types
          : types // ignore: cast_nullable_to_non_nullable
              as List<NetworkPokemonType>,
      stats: null == stats
          ? _value.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<NetworkPokemonStat>,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
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
abstract class _$$NetworkPokemonImplCopyWith<$Res>
    implements $NetworkPokemonCopyWith<$Res> {
  factory _$$NetworkPokemonImplCopyWith(_$NetworkPokemonImpl value,
          $Res Function(_$NetworkPokemonImpl) then) =
      __$$NetworkPokemonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'base_experience') int? baseExp,
      @JsonKey(name: 'height') int? height,
      @JsonKey(name: 'is_default') bool isDefault,
      @JsonKey(name: 'order') int? order,
      @JsonKey(name: 'weight') int? weight,
      @JsonKey(name: 'forms') List<NetworkNamedAPIResource> forms,
      @JsonKey(name: 'types') List<NetworkPokemonType> types,
      @JsonKey(name: 'stats') List<NetworkPokemonStat> stats,
      @JsonKey(name: 'species') NetworkNamedAPIResource species});

  @override
  $NetworkNamedAPIResourceCopyWith<$Res> get species;
}

/// @nodoc
class __$$NetworkPokemonImplCopyWithImpl<$Res>
    extends _$NetworkPokemonCopyWithImpl<$Res, _$NetworkPokemonImpl>
    implements _$$NetworkPokemonImplCopyWith<$Res> {
  __$$NetworkPokemonImplCopyWithImpl(
      _$NetworkPokemonImpl _value, $Res Function(_$NetworkPokemonImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? baseExp = freezed,
    Object? height = freezed,
    Object? isDefault = null,
    Object? order = freezed,
    Object? weight = freezed,
    Object? forms = null,
    Object? types = null,
    Object? stats = null,
    Object? species = null,
  }) {
    return _then(_$NetworkPokemonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      baseExp: freezed == baseExp
          ? _value.baseExp
          : baseExp // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
      isDefault: null == isDefault
          ? _value.isDefault
          : isDefault // ignore: cast_nullable_to_non_nullable
              as bool,
      order: freezed == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      forms: null == forms
          ? _value._forms
          : forms // ignore: cast_nullable_to_non_nullable
              as List<NetworkNamedAPIResource>,
      types: null == types
          ? _value._types
          : types // ignore: cast_nullable_to_non_nullable
              as List<NetworkPokemonType>,
      stats: null == stats
          ? _value._stats
          : stats // ignore: cast_nullable_to_non_nullable
              as List<NetworkPokemonStat>,
      species: null == species
          ? _value.species
          : species // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkPokemonImpl implements _NetworkPokemon {
  _$NetworkPokemonImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'base_experience') required this.baseExp,
      @JsonKey(name: 'height') required this.height,
      @JsonKey(name: 'is_default') required this.isDefault,
      @JsonKey(name: 'order') required this.order,
      @JsonKey(name: 'weight') required this.weight,
      @JsonKey(name: 'forms')
      required final List<NetworkNamedAPIResource> forms,
      @JsonKey(name: 'types') required final List<NetworkPokemonType> types,
      @JsonKey(name: 'stats') required final List<NetworkPokemonStat> stats,
      @JsonKey(name: 'species') required this.species})
      : _forms = forms,
        _types = types,
        _stats = stats;

  factory _$NetworkPokemonImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkPokemonImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'base_experience')
  final int? baseExp;
  @override
  @JsonKey(name: 'height')
  final int? height;
  @override
  @JsonKey(name: 'is_default')
  final bool isDefault;
  @override
  @JsonKey(name: 'order')
  final int? order;
  @override
  @JsonKey(name: 'weight')
  final int? weight;
  final List<NetworkNamedAPIResource> _forms;
  @override
  @JsonKey(name: 'forms')
  List<NetworkNamedAPIResource> get forms {
    if (_forms is EqualUnmodifiableListView) return _forms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_forms);
  }

  final List<NetworkPokemonType> _types;
  @override
  @JsonKey(name: 'types')
  List<NetworkPokemonType> get types {
    if (_types is EqualUnmodifiableListView) return _types;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_types);
  }

  final List<NetworkPokemonStat> _stats;
  @override
  @JsonKey(name: 'stats')
  List<NetworkPokemonStat> get stats {
    if (_stats is EqualUnmodifiableListView) return _stats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stats);
  }

  @override
  @JsonKey(name: 'species')
  final NetworkNamedAPIResource species;

  @override
  String toString() {
    return 'NetworkPokemon(id: $id, name: $name, baseExp: $baseExp, height: $height, isDefault: $isDefault, order: $order, weight: $weight, forms: $forms, types: $types, stats: $stats, species: $species)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkPokemonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.baseExp, baseExp) || other.baseExp == baseExp) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.isDefault, isDefault) ||
                other.isDefault == isDefault) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            const DeepCollectionEquality().equals(other._forms, _forms) &&
            const DeepCollectionEquality().equals(other._types, _types) &&
            const DeepCollectionEquality().equals(other._stats, _stats) &&
            (identical(other.species, species) || other.species == species));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      baseExp,
      height,
      isDefault,
      order,
      weight,
      const DeepCollectionEquality().hash(_forms),
      const DeepCollectionEquality().hash(_types),
      const DeepCollectionEquality().hash(_stats),
      species);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkPokemonImplCopyWith<_$NetworkPokemonImpl> get copyWith =>
      __$$NetworkPokemonImplCopyWithImpl<_$NetworkPokemonImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkPokemonImplToJson(
      this,
    );
  }
}

abstract class _NetworkPokemon implements NetworkPokemon {
  factory _NetworkPokemon(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'base_experience') required final int? baseExp,
      @JsonKey(name: 'height') required final int? height,
      @JsonKey(name: 'is_default') required final bool isDefault,
      @JsonKey(name: 'order') required final int? order,
      @JsonKey(name: 'weight') required final int? weight,
      @JsonKey(name: 'forms')
      required final List<NetworkNamedAPIResource> forms,
      @JsonKey(name: 'types') required final List<NetworkPokemonType> types,
      @JsonKey(name: 'stats') required final List<NetworkPokemonStat> stats,
      @JsonKey(name: 'species')
      required final NetworkNamedAPIResource species}) = _$NetworkPokemonImpl;

  factory _NetworkPokemon.fromJson(Map<String, dynamic> json) =
      _$NetworkPokemonImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'base_experience')
  int? get baseExp;
  @override
  @JsonKey(name: 'height')
  int? get height;
  @override
  @JsonKey(name: 'is_default')
  bool get isDefault;
  @override
  @JsonKey(name: 'order')
  int? get order;
  @override
  @JsonKey(name: 'weight')
  int? get weight;
  @override
  @JsonKey(name: 'forms')
  List<NetworkNamedAPIResource> get forms;
  @override
  @JsonKey(name: 'types')
  List<NetworkPokemonType> get types;
  @override
  @JsonKey(name: 'stats')
  List<NetworkPokemonStat> get stats;
  @override
  @JsonKey(name: 'species')
  NetworkNamedAPIResource get species;
  @override
  @JsonKey(ignore: true)
  _$$NetworkPokemonImplCopyWith<_$NetworkPokemonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
