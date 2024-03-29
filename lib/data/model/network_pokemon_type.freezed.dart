// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_pokemon_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkPokemonType _$NetworkPokemonTypeFromJson(Map<String, dynamic> json) {
  return _NetworkPokemonType.fromJson(json);
}

/// @nodoc
mixin _$NetworkPokemonType {
  @JsonKey(name: 'slot')
  int get slot => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  NetworkNamedAPIResource get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkPokemonTypeCopyWith<NetworkPokemonType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkPokemonTypeCopyWith<$Res> {
  factory $NetworkPokemonTypeCopyWith(
          NetworkPokemonType value, $Res Function(NetworkPokemonType) then) =
      _$NetworkPokemonTypeCopyWithImpl<$Res, NetworkPokemonType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'slot') int slot,
      @JsonKey(name: 'type') NetworkNamedAPIResource type});

  $NetworkNamedAPIResourceCopyWith<$Res> get type;
}

/// @nodoc
class _$NetworkPokemonTypeCopyWithImpl<$Res, $Val extends NetworkPokemonType>
    implements $NetworkPokemonTypeCopyWith<$Res> {
  _$NetworkPokemonTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkNamedAPIResourceCopyWith<$Res> get type {
    return $NetworkNamedAPIResourceCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NetworkPokemonTypeImplCopyWith<$Res>
    implements $NetworkPokemonTypeCopyWith<$Res> {
  factory _$$NetworkPokemonTypeImplCopyWith(_$NetworkPokemonTypeImpl value,
          $Res Function(_$NetworkPokemonTypeImpl) then) =
      __$$NetworkPokemonTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'slot') int slot,
      @JsonKey(name: 'type') NetworkNamedAPIResource type});

  @override
  $NetworkNamedAPIResourceCopyWith<$Res> get type;
}

/// @nodoc
class __$$NetworkPokemonTypeImplCopyWithImpl<$Res>
    extends _$NetworkPokemonTypeCopyWithImpl<$Res, _$NetworkPokemonTypeImpl>
    implements _$$NetworkPokemonTypeImplCopyWith<$Res> {
  __$$NetworkPokemonTypeImplCopyWithImpl(_$NetworkPokemonTypeImpl _value,
      $Res Function(_$NetworkPokemonTypeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_$NetworkPokemonTypeImpl(
      slot: null == slot
          ? _value.slot
          : slot // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkPokemonTypeImpl implements _NetworkPokemonType {
  _$NetworkPokemonTypeImpl(
      {@JsonKey(name: 'slot') required this.slot,
      @JsonKey(name: 'type') required this.type});

  factory _$NetworkPokemonTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkPokemonTypeImplFromJson(json);

  @override
  @JsonKey(name: 'slot')
  final int slot;
  @override
  @JsonKey(name: 'type')
  final NetworkNamedAPIResource type;

  @override
  String toString() {
    return 'NetworkPokemonType(slot: $slot, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkPokemonTypeImpl &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, slot, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkPokemonTypeImplCopyWith<_$NetworkPokemonTypeImpl> get copyWith =>
      __$$NetworkPokemonTypeImplCopyWithImpl<_$NetworkPokemonTypeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkPokemonTypeImplToJson(
      this,
    );
  }
}

abstract class _NetworkPokemonType implements NetworkPokemonType {
  factory _NetworkPokemonType(
          {@JsonKey(name: 'slot') required final int slot,
          @JsonKey(name: 'type') required final NetworkNamedAPIResource type}) =
      _$NetworkPokemonTypeImpl;

  factory _NetworkPokemonType.fromJson(Map<String, dynamic> json) =
      _$NetworkPokemonTypeImpl.fromJson;

  @override
  @JsonKey(name: 'slot')
  int get slot;
  @override
  @JsonKey(name: 'type')
  NetworkNamedAPIResource get type;
  @override
  @JsonKey(ignore: true)
  _$$NetworkPokemonTypeImplCopyWith<_$NetworkPokemonTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
