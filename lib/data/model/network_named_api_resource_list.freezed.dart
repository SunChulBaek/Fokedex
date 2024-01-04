// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_named_api_resource_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NetworkNamedAPIResourceList _$NetworkNamedAPIResourceListFromJson(
    Map<String, dynamic> json) {
  return _NetworkNamedAPIResourceList.fromJson(json);
}

/// @nodoc
mixin _$NetworkNamedAPIResourceList {
  @JsonKey(name: 'count')
  int get count => throw _privateConstructorUsedError;
  @JsonKey(name: 'previous')
  String? get prev => throw _privateConstructorUsedError;
  @JsonKey(name: 'next')
  String? get next => throw _privateConstructorUsedError;
  @JsonKey(name: 'results')
  List<NetworkNamedAPIResource> get results =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NetworkNamedAPIResourceListCopyWith<NetworkNamedAPIResourceList>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NetworkNamedAPIResourceListCopyWith<$Res> {
  factory $NetworkNamedAPIResourceListCopyWith(
          NetworkNamedAPIResourceList value,
          $Res Function(NetworkNamedAPIResourceList) then) =
      _$NetworkNamedAPIResourceListCopyWithImpl<$Res,
          NetworkNamedAPIResourceList>;
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int count,
      @JsonKey(name: 'previous') String? prev,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'results') List<NetworkNamedAPIResource> results});
}

/// @nodoc
class _$NetworkNamedAPIResourceListCopyWithImpl<$Res,
        $Val extends NetworkNamedAPIResourceList>
    implements $NetworkNamedAPIResourceListCopyWith<$Res> {
  _$NetworkNamedAPIResourceListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? prev = freezed,
    Object? next = freezed,
    Object? results = null,
  }) {
    return _then(_value.copyWith(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<NetworkNamedAPIResource>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NetworkNamedAPIResourceListImplCopyWith<$Res>
    implements $NetworkNamedAPIResourceListCopyWith<$Res> {
  factory _$$NetworkNamedAPIResourceListImplCopyWith(
          _$NetworkNamedAPIResourceListImpl value,
          $Res Function(_$NetworkNamedAPIResourceListImpl) then) =
      __$$NetworkNamedAPIResourceListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'count') int count,
      @JsonKey(name: 'previous') String? prev,
      @JsonKey(name: 'next') String? next,
      @JsonKey(name: 'results') List<NetworkNamedAPIResource> results});
}

/// @nodoc
class __$$NetworkNamedAPIResourceListImplCopyWithImpl<$Res>
    extends _$NetworkNamedAPIResourceListCopyWithImpl<$Res,
        _$NetworkNamedAPIResourceListImpl>
    implements _$$NetworkNamedAPIResourceListImplCopyWith<$Res> {
  __$$NetworkNamedAPIResourceListImplCopyWithImpl(
      _$NetworkNamedAPIResourceListImpl _value,
      $Res Function(_$NetworkNamedAPIResourceListImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = null,
    Object? prev = freezed,
    Object? next = freezed,
    Object? results = null,
  }) {
    return _then(_$NetworkNamedAPIResourceListImpl(
      count: null == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int,
      prev: freezed == prev
          ? _value.prev
          : prev // ignore: cast_nullable_to_non_nullable
              as String?,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      results: null == results
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<NetworkNamedAPIResource>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkNamedAPIResourceListImpl
    implements _NetworkNamedAPIResourceList {
  _$NetworkNamedAPIResourceListImpl(
      {@JsonKey(name: 'count') required this.count,
      @JsonKey(name: 'previous') required this.prev,
      @JsonKey(name: 'next') required this.next,
      @JsonKey(name: 'results')
      required final List<NetworkNamedAPIResource> results})
      : _results = results;

  factory _$NetworkNamedAPIResourceListImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$NetworkNamedAPIResourceListImplFromJson(json);

  @override
  @JsonKey(name: 'count')
  final int count;
  @override
  @JsonKey(name: 'previous')
  final String? prev;
  @override
  @JsonKey(name: 'next')
  final String? next;
  final List<NetworkNamedAPIResource> _results;
  @override
  @JsonKey(name: 'results')
  List<NetworkNamedAPIResource> get results {
    if (_results is EqualUnmodifiableListView) return _results;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_results);
  }

  @override
  String toString() {
    return 'NetworkNamedAPIResourceList(count: $count, prev: $prev, next: $next, results: $results)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkNamedAPIResourceListImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.prev, prev) || other.prev == prev) &&
            (identical(other.next, next) || other.next == next) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, count, prev, next,
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkNamedAPIResourceListImplCopyWith<_$NetworkNamedAPIResourceListImpl>
      get copyWith => __$$NetworkNamedAPIResourceListImplCopyWithImpl<
          _$NetworkNamedAPIResourceListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkNamedAPIResourceListImplToJson(
      this,
    );
  }
}

abstract class _NetworkNamedAPIResourceList
    implements NetworkNamedAPIResourceList {
  factory _NetworkNamedAPIResourceList(
          {@JsonKey(name: 'count') required final int count,
          @JsonKey(name: 'previous') required final String? prev,
          @JsonKey(name: 'next') required final String? next,
          @JsonKey(name: 'results')
          required final List<NetworkNamedAPIResource> results}) =
      _$NetworkNamedAPIResourceListImpl;

  factory _NetworkNamedAPIResourceList.fromJson(Map<String, dynamic> json) =
      _$NetworkNamedAPIResourceListImpl.fromJson;

  @override
  @JsonKey(name: 'count')
  int get count;
  @override
  @JsonKey(name: 'previous')
  String? get prev;
  @override
  @JsonKey(name: 'next')
  String? get next;
  @override
  @JsonKey(name: 'results')
  List<NetworkNamedAPIResource> get results;
  @override
  @JsonKey(ignore: true)
  _$$NetworkNamedAPIResourceListImplCopyWith<_$NetworkNamedAPIResourceListImpl>
      get copyWith => throw _privateConstructorUsedError;
}
