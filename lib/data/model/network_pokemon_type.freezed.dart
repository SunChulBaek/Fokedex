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

/// @nodoc
mixin _$NetworkPokemonType {
  @JsonKey(name: 'slot')
  int get slot => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  NetworkNamedAPIResource get type => throw _privateConstructorUsedError;

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
abstract class _$$_NetworkPokemonTypeCopyWith<$Res>
    implements $NetworkPokemonTypeCopyWith<$Res> {
  factory _$$_NetworkPokemonTypeCopyWith(_$_NetworkPokemonType value,
          $Res Function(_$_NetworkPokemonType) then) =
      __$$_NetworkPokemonTypeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'slot') int slot,
      @JsonKey(name: 'type') NetworkNamedAPIResource type});

  @override
  $NetworkNamedAPIResourceCopyWith<$Res> get type;
}

/// @nodoc
class __$$_NetworkPokemonTypeCopyWithImpl<$Res>
    extends _$NetworkPokemonTypeCopyWithImpl<$Res, _$_NetworkPokemonType>
    implements _$$_NetworkPokemonTypeCopyWith<$Res> {
  __$$_NetworkPokemonTypeCopyWithImpl(
      _$_NetworkPokemonType _value, $Res Function(_$_NetworkPokemonType) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? slot = null,
    Object? type = null,
  }) {
    return _then(_$_NetworkPokemonType(
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

class _$_NetworkPokemonType implements _NetworkPokemonType {
  _$_NetworkPokemonType(
      {@JsonKey(name: 'slot') required this.slot,
      @JsonKey(name: 'type') required this.type});

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkPokemonType &&
            (identical(other.slot, slot) || other.slot == slot) &&
            (identical(other.type, type) || other.type == type));
  }

  @override
  int get hashCode => Object.hash(runtimeType, slot, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkPokemonTypeCopyWith<_$_NetworkPokemonType> get copyWith =>
      __$$_NetworkPokemonTypeCopyWithImpl<_$_NetworkPokemonType>(
          this, _$identity);
}

abstract class _NetworkPokemonType implements NetworkPokemonType {
  factory _NetworkPokemonType(
          {@JsonKey(name: 'slot') required final int slot,
          @JsonKey(name: 'type') required final NetworkNamedAPIResource type}) =
      _$_NetworkPokemonType;

  @override
  @JsonKey(name: 'slot')
  int get slot;
  @override
  @JsonKey(name: 'type')
  NetworkNamedAPIResource get type;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkPokemonTypeCopyWith<_$_NetworkPokemonType> get copyWith =>
      throw _privateConstructorUsedError;
}
