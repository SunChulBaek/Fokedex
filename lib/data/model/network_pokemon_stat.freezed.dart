// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_pokemon_stat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkPokemonStat {
  @JsonKey(name: 'base_stat')
  int get baseStat => throw _privateConstructorUsedError;
  @JsonKey(name: 'effort')
  int get effort => throw _privateConstructorUsedError;
  @JsonKey(name: 'stat')
  NetworkNamedAPIResource get stat => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkPokemonStatCopyWith<NetworkPokemonStat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkPokemonStatCopyWith<$Res> {
  factory $NetworkPokemonStatCopyWith(
          NetworkPokemonStat value, $Res Function(NetworkPokemonStat) then) =
      _$NetworkPokemonStatCopyWithImpl<$Res, NetworkPokemonStat>;
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat,
      @JsonKey(name: 'effort') int effort,
      @JsonKey(name: 'stat') NetworkNamedAPIResource stat});

  $NetworkNamedAPIResourceCopyWith<$Res> get stat;
}

/// @nodoc
class _$NetworkPokemonStatCopyWithImpl<$Res, $Val extends NetworkPokemonStat>
    implements $NetworkPokemonStatCopyWith<$Res> {
  _$NetworkPokemonStatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(_value.copyWith(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkNamedAPIResourceCopyWith<$Res> get stat {
    return $NetworkNamedAPIResourceCopyWith<$Res>(_value.stat, (value) {
      return _then(_value.copyWith(stat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NetworkPokemonStatCopyWith<$Res>
    implements $NetworkPokemonStatCopyWith<$Res> {
  factory _$$_NetworkPokemonStatCopyWith(_$_NetworkPokemonStat value,
          $Res Function(_$_NetworkPokemonStat) then) =
      __$$_NetworkPokemonStatCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'base_stat') int baseStat,
      @JsonKey(name: 'effort') int effort,
      @JsonKey(name: 'stat') NetworkNamedAPIResource stat});

  @override
  $NetworkNamedAPIResourceCopyWith<$Res> get stat;
}

/// @nodoc
class __$$_NetworkPokemonStatCopyWithImpl<$Res>
    extends _$NetworkPokemonStatCopyWithImpl<$Res, _$_NetworkPokemonStat>
    implements _$$_NetworkPokemonStatCopyWith<$Res> {
  __$$_NetworkPokemonStatCopyWithImpl(
      _$_NetworkPokemonStat _value, $Res Function(_$_NetworkPokemonStat) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseStat = null,
    Object? effort = null,
    Object? stat = null,
  }) {
    return _then(_$_NetworkPokemonStat(
      baseStat: null == baseStat
          ? _value.baseStat
          : baseStat // ignore: cast_nullable_to_non_nullable
              as int,
      effort: null == effort
          ? _value.effort
          : effort // ignore: cast_nullable_to_non_nullable
              as int,
      stat: null == stat
          ? _value.stat
          : stat // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ));
  }
}

/// @nodoc

class _$_NetworkPokemonStat implements _NetworkPokemonStat {
  _$_NetworkPokemonStat(
      {@JsonKey(name: 'base_stat') required this.baseStat,
      @JsonKey(name: 'effort') required this.effort,
      @JsonKey(name: 'stat') required this.stat});

  @override
  @JsonKey(name: 'base_stat')
  final int baseStat;
  @override
  @JsonKey(name: 'effort')
  final int effort;
  @override
  @JsonKey(name: 'stat')
  final NetworkNamedAPIResource stat;

  @override
  String toString() {
    return 'NetworkPokemonStat(baseStat: $baseStat, effort: $effort, stat: $stat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkPokemonStat &&
            (identical(other.baseStat, baseStat) ||
                other.baseStat == baseStat) &&
            (identical(other.effort, effort) || other.effort == effort) &&
            (identical(other.stat, stat) || other.stat == stat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, baseStat, effort, stat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkPokemonStatCopyWith<_$_NetworkPokemonStat> get copyWith =>
      __$$_NetworkPokemonStatCopyWithImpl<_$_NetworkPokemonStat>(
          this, _$identity);
}

abstract class _NetworkPokemonStat implements NetworkPokemonStat {
  factory _NetworkPokemonStat(
          {@JsonKey(name: 'base_stat') required final int baseStat,
          @JsonKey(name: 'effort') required final int effort,
          @JsonKey(name: 'stat') required final NetworkNamedAPIResource stat}) =
      _$_NetworkPokemonStat;

  @override
  @JsonKey(name: 'base_stat')
  int get baseStat;
  @override
  @JsonKey(name: 'effort')
  int get effort;
  @override
  @JsonKey(name: 'stat')
  NetworkNamedAPIResource get stat;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkPokemonStatCopyWith<_$_NetworkPokemonStat> get copyWith =>
      throw _privateConstructorUsedError;
}
