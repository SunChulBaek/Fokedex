// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_pokemon_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$NetworkPokemonForm {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'form_names')
  List<NetworkName> get formNames => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NetworkPokemonFormCopyWith<NetworkPokemonForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkPokemonFormCopyWith<$Res> {
  factory $NetworkPokemonFormCopyWith(
          NetworkPokemonForm value, $Res Function(NetworkPokemonForm) then) =
      _$NetworkPokemonFormCopyWithImpl<$Res, NetworkPokemonForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'form_names') List<NetworkName> formNames});
}

/// @nodoc
class _$NetworkPokemonFormCopyWithImpl<$Res, $Val extends NetworkPokemonForm>
    implements $NetworkPokemonFormCopyWith<$Res> {
  _$NetworkPokemonFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? formNames = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      formNames: null == formNames
          ? _value.formNames
          : formNames // ignore: cast_nullable_to_non_nullable
              as List<NetworkName>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NetworkPokemonFormCopyWith<$Res>
    implements $NetworkPokemonFormCopyWith<$Res> {
  factory _$$_NetworkPokemonFormCopyWith(_$_NetworkPokemonForm value,
          $Res Function(_$_NetworkPokemonForm) then) =
      __$$_NetworkPokemonFormCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'form_names') List<NetworkName> formNames});
}

/// @nodoc
class __$$_NetworkPokemonFormCopyWithImpl<$Res>
    extends _$NetworkPokemonFormCopyWithImpl<$Res, _$_NetworkPokemonForm>
    implements _$$_NetworkPokemonFormCopyWith<$Res> {
  __$$_NetworkPokemonFormCopyWithImpl(
      _$_NetworkPokemonForm _value, $Res Function(_$_NetworkPokemonForm) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? formNames = null,
  }) {
    return _then(_$_NetworkPokemonForm(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      formNames: null == formNames
          ? _value._formNames
          : formNames // ignore: cast_nullable_to_non_nullable
              as List<NetworkName>,
    ));
  }
}

/// @nodoc

class _$_NetworkPokemonForm implements _NetworkPokemonForm {
  _$_NetworkPokemonForm(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'form_names') required final List<NetworkName> formNames})
      : _formNames = formNames;

  @override
  @JsonKey(name: 'id')
  final int id;
  final List<NetworkName> _formNames;
  @override
  @JsonKey(name: 'form_names')
  List<NetworkName> get formNames {
    if (_formNames is EqualUnmodifiableListView) return _formNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_formNames);
  }

  @override
  String toString() {
    return 'NetworkPokemonForm(id: $id, formNames: $formNames)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NetworkPokemonForm &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other._formNames, _formNames));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_formNames));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NetworkPokemonFormCopyWith<_$_NetworkPokemonForm> get copyWith =>
      __$$_NetworkPokemonFormCopyWithImpl<_$_NetworkPokemonForm>(
          this, _$identity);
}

abstract class _NetworkPokemonForm implements NetworkPokemonForm {
  factory _NetworkPokemonForm(
      {@JsonKey(name: 'id')
          required final int id,
      @JsonKey(name: 'form_names')
          required final List<NetworkName> formNames}) = _$_NetworkPokemonForm;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'form_names')
  List<NetworkName> get formNames;
  @override
  @JsonKey(ignore: true)
  _$$_NetworkPokemonFormCopyWith<_$_NetworkPokemonForm> get copyWith =>
      throw _privateConstructorUsedError;
}
