// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pokemon_detail_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UiPokemonDetailData {
  PokemonDetail? get pokemon => throw _privateConstructorUsedError;
  List<UiPokemonDetailItem> get items => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UiPokemonDetailDataCopyWith<UiPokemonDetailData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UiPokemonDetailDataCopyWith<$Res> {
  factory $UiPokemonDetailDataCopyWith(
          UiPokemonDetailData value, $Res Function(UiPokemonDetailData) then) =
      _$UiPokemonDetailDataCopyWithImpl<$Res, UiPokemonDetailData>;
  @useResult
  $Res call({PokemonDetail? pokemon, List<UiPokemonDetailItem> items});

  $PokemonDetailCopyWith<$Res>? get pokemon;
}

/// @nodoc
class _$UiPokemonDetailDataCopyWithImpl<$Res, $Val extends UiPokemonDetailData>
    implements $UiPokemonDetailDataCopyWith<$Res> {
  _$UiPokemonDetailDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemon = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      pokemon: freezed == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as PokemonDetail?,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UiPokemonDetailItem>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PokemonDetailCopyWith<$Res>? get pokemon {
    if (_value.pokemon == null) {
      return null;
    }

    return $PokemonDetailCopyWith<$Res>(_value.pokemon!, (value) {
      return _then(_value.copyWith(pokemon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UiPokemonDetailDataImplCopyWith<$Res>
    implements $UiPokemonDetailDataCopyWith<$Res> {
  factory _$$UiPokemonDetailDataImplCopyWith(_$UiPokemonDetailDataImpl value,
          $Res Function(_$UiPokemonDetailDataImpl) then) =
      __$$UiPokemonDetailDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PokemonDetail? pokemon, List<UiPokemonDetailItem> items});

  @override
  $PokemonDetailCopyWith<$Res>? get pokemon;
}

/// @nodoc
class __$$UiPokemonDetailDataImplCopyWithImpl<$Res>
    extends _$UiPokemonDetailDataCopyWithImpl<$Res, _$UiPokemonDetailDataImpl>
    implements _$$UiPokemonDetailDataImplCopyWith<$Res> {
  __$$UiPokemonDetailDataImplCopyWithImpl(_$UiPokemonDetailDataImpl _value,
      $Res Function(_$UiPokemonDetailDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pokemon = freezed,
    Object? items = null,
  }) {
    return _then(_$UiPokemonDetailDataImpl(
      pokemon: freezed == pokemon
          ? _value.pokemon
          : pokemon // ignore: cast_nullable_to_non_nullable
              as PokemonDetail?,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<UiPokemonDetailItem>,
    ));
  }
}

/// @nodoc

class _$UiPokemonDetailDataImpl implements _UiPokemonDetailData {
  _$UiPokemonDetailDataImpl(
      {required this.pokemon, required final List<UiPokemonDetailItem> items})
      : _items = items;

  @override
  final PokemonDetail? pokemon;
  final List<UiPokemonDetailItem> _items;
  @override
  List<UiPokemonDetailItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'UiPokemonDetailData(pokemon: $pokemon, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UiPokemonDetailDataImpl &&
            (identical(other.pokemon, pokemon) || other.pokemon == pokemon) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, pokemon, const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UiPokemonDetailDataImplCopyWith<_$UiPokemonDetailDataImpl> get copyWith =>
      __$$UiPokemonDetailDataImplCopyWithImpl<_$UiPokemonDetailDataImpl>(
          this, _$identity);
}

abstract class _UiPokemonDetailData implements UiPokemonDetailData {
  factory _UiPokemonDetailData(
          {required final PokemonDetail? pokemon,
          required final List<UiPokemonDetailItem> items}) =
      _$UiPokemonDetailDataImpl;

  @override
  PokemonDetail? get pokemon;
  @override
  List<UiPokemonDetailItem> get items;
  @override
  @JsonKey(ignore: true)
  _$$UiPokemonDetailDataImplCopyWith<_$UiPokemonDetailDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
