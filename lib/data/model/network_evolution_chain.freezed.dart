// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_evolution_chain.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkEvolutionChain {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'chain')
  NetworkChainLink get chain => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkEvolutionChainCopyWith<NetworkEvolutionChain> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkEvolutionChainCopyWith<$Res> {
  factory $NetworkEvolutionChainCopyWith(NetworkEvolutionChain value,
          $Res Function(NetworkEvolutionChain) then) =
      _$NetworkEvolutionChainCopyWithImpl<$Res, NetworkEvolutionChain>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'chain') NetworkChainLink chain});

  $NetworkChainLinkCopyWith<$Res> get chain;
}

/// @nodoc
class _$NetworkEvolutionChainCopyWithImpl<$Res,
        $Val extends NetworkEvolutionChain>
    implements $NetworkEvolutionChainCopyWith<$Res> {
  _$NetworkEvolutionChainCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chain = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chain: null == chain
          ? _value.chain
          : chain // ignore: cast_nullable_to_non_nullable
              as NetworkChainLink,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkChainLinkCopyWith<$Res> get chain {
    return $NetworkChainLinkCopyWith<$Res>(_value.chain, (value) {
      return _then(_value.copyWith(chain: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NetworkEvolutionChainCopyWith<$Res>
    implements $NetworkEvolutionChainCopyWith<$Res> {
  factory _$$_NetworkEvolutionChainCopyWith(_$_NetworkEvolutionChain value,
          $Res Function(_$_NetworkEvolutionChain) then) =
      __$$_NetworkEvolutionChainCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'chain') NetworkChainLink chain});

  @override
  $NetworkChainLinkCopyWith<$Res> get chain;
}

/// @nodoc
class __$$_NetworkEvolutionChainCopyWithImpl<$Res>
    extends _$NetworkEvolutionChainCopyWithImpl<$Res, _$_NetworkEvolutionChain>
    implements _$$_NetworkEvolutionChainCopyWith<$Res> {
  __$$_NetworkEvolutionChainCopyWithImpl(_$_NetworkEvolutionChain _value,
      $Res Function(_$_NetworkEvolutionChain) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chain = null,
  }) {
    return _then(_$_NetworkEvolutionChain(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      chain: null == chain
          ? _value.chain
          : chain // ignore: cast_nullable_to_non_nullable
              as NetworkChainLink,
    ));
  }
}

/// @nodoc

class _$_NetworkEvolutionChain implements _NetworkEvolutionChain {
  _$_NetworkEvolutionChain(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'chain') required this.chain});

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'chain')
  final NetworkChainLink chain;

  @override
  String toString() {
    return 'NetworkEvolutionChain(id: $id, chain: $chain)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkEvolutionChain &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chain, chain) || other.chain == chain));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, chain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkEvolutionChainCopyWith<_$_NetworkEvolutionChain> get copyWith =>
      __$$_NetworkEvolutionChainCopyWithImpl<_$_NetworkEvolutionChain>(
          this, _$identity);
}

abstract class _NetworkEvolutionChain implements NetworkEvolutionChain {
  factory _NetworkEvolutionChain(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'chain') required final NetworkChainLink chain}) =
      _$_NetworkEvolutionChain;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'chain')
  NetworkChainLink get chain;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkEvolutionChainCopyWith<_$_NetworkEvolutionChain> get copyWith =>
      throw _privateConstructorUsedError;
}
