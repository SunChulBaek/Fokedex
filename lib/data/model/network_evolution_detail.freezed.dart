// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_evolution_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkEvolutionDetail {
  @JsonKey(name: 'item')
  NetworkNamedAPIResource get item => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkEvolutionDetailCopyWith<NetworkEvolutionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkEvolutionDetailCopyWith<$Res> {
  factory $NetworkEvolutionDetailCopyWith(NetworkEvolutionDetail value,
          $Res Function(NetworkEvolutionDetail) then) =
      _$NetworkEvolutionDetailCopyWithImpl<$Res, NetworkEvolutionDetail>;
  @useResult
  $Res call({@JsonKey(name: 'item') NetworkNamedAPIResource item});

  $NetworkNamedAPIResourceCopyWith<$Res> get item;
}

/// @nodoc
class _$NetworkEvolutionDetailCopyWithImpl<$Res,
        $Val extends NetworkEvolutionDetail>
    implements $NetworkEvolutionDetailCopyWith<$Res> {
  _$NetworkEvolutionDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_value.copyWith(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $NetworkNamedAPIResourceCopyWith<$Res> get item {
    return $NetworkNamedAPIResourceCopyWith<$Res>(_value.item, (value) {
      return _then(_value.copyWith(item: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_NetworkEvolutionDetailCopyWith<$Res>
    implements $NetworkEvolutionDetailCopyWith<$Res> {
  factory _$$_NetworkEvolutionDetailCopyWith(_$_NetworkEvolutionDetail value,
          $Res Function(_$_NetworkEvolutionDetail) then) =
      __$$_NetworkEvolutionDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'item') NetworkNamedAPIResource item});

  @override
  $NetworkNamedAPIResourceCopyWith<$Res> get item;
}

/// @nodoc
class __$$_NetworkEvolutionDetailCopyWithImpl<$Res>
    extends _$NetworkEvolutionDetailCopyWithImpl<$Res,
        _$_NetworkEvolutionDetail>
    implements _$$_NetworkEvolutionDetailCopyWith<$Res> {
  __$$_NetworkEvolutionDetailCopyWithImpl(_$_NetworkEvolutionDetail _value,
      $Res Function(_$_NetworkEvolutionDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? item = null,
  }) {
    return _then(_$_NetworkEvolutionDetail(
      item: null == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as NetworkNamedAPIResource,
    ));
  }
}

/// @nodoc

class _$_NetworkEvolutionDetail implements _NetworkEvolutionDetail {
  _$_NetworkEvolutionDetail({@JsonKey(name: 'item') required this.item});

  @override
  @JsonKey(name: 'item')
  final NetworkNamedAPIResource item;

  @override
  String toString() {
    return 'NetworkEvolutionDetail(item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkEvolutionDetail &&
            (identical(other.item, item) || other.item == item));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkEvolutionDetailCopyWith<_$_NetworkEvolutionDetail> get copyWith =>
      __$$_NetworkEvolutionDetailCopyWithImpl<_$_NetworkEvolutionDetail>(
          this, _$identity);
}

abstract class _NetworkEvolutionDetail implements NetworkEvolutionDetail {
  factory _NetworkEvolutionDetail(
          {@JsonKey(name: 'item')
              required final NetworkNamedAPIResource item}) =
      _$_NetworkEvolutionDetail;

  @override
  @JsonKey(name: 'item')
  NetworkNamedAPIResource get item;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkEvolutionDetailCopyWith<_$_NetworkEvolutionDetail> get copyWith =>
      throw _privateConstructorUsedError;
}
