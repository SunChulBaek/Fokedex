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

NetworkEvolutionChain _$NetworkEvolutionChainFromJson(
    Map<String, dynamic> json) {
  return _NetworkEvolutionChain.fromJson(json);
}

/// @nodoc
mixin _$NetworkEvolutionChain {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'chain')
  NetworkChainLink get chain => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
abstract class _$$NetworkEvolutionChainImplCopyWith<$Res>
    implements $NetworkEvolutionChainCopyWith<$Res> {
  factory _$$NetworkEvolutionChainImplCopyWith(
          _$NetworkEvolutionChainImpl value,
          $Res Function(_$NetworkEvolutionChainImpl) then) =
      __$$NetworkEvolutionChainImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'chain') NetworkChainLink chain});

  @override
  $NetworkChainLinkCopyWith<$Res> get chain;
}

/// @nodoc
class __$$NetworkEvolutionChainImplCopyWithImpl<$Res>
    extends _$NetworkEvolutionChainCopyWithImpl<$Res,
        _$NetworkEvolutionChainImpl>
    implements _$$NetworkEvolutionChainImplCopyWith<$Res> {
  __$$NetworkEvolutionChainImplCopyWithImpl(_$NetworkEvolutionChainImpl _value,
      $Res Function(_$NetworkEvolutionChainImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? chain = null,
  }) {
    return _then(_$NetworkEvolutionChainImpl(
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
@JsonSerializable()
class _$NetworkEvolutionChainImpl implements _NetworkEvolutionChain {
  _$NetworkEvolutionChainImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'chain') required this.chain});

  factory _$NetworkEvolutionChainImpl.fromJson(Map<String, dynamic> json) =>
      _$$NetworkEvolutionChainImplFromJson(json);

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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkEvolutionChainImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.chain, chain) || other.chain == chain));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, chain);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkEvolutionChainImplCopyWith<_$NetworkEvolutionChainImpl>
      get copyWith => __$$NetworkEvolutionChainImplCopyWithImpl<
          _$NetworkEvolutionChainImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkEvolutionChainImplToJson(
      this,
    );
  }
}

abstract class _NetworkEvolutionChain implements NetworkEvolutionChain {
  factory _NetworkEvolutionChain(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'chain') required final NetworkChainLink chain}) =
      _$NetworkEvolutionChainImpl;

  factory _NetworkEvolutionChain.fromJson(Map<String, dynamic> json) =
      _$NetworkEvolutionChainImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'chain')
  NetworkChainLink get chain;
  @override
  @JsonKey(ignore: true)
  _$$NetworkEvolutionChainImplCopyWith<_$NetworkEvolutionChainImpl>
      get copyWith => throw _privateConstructorUsedError;
}
