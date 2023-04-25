import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

// flutter pub run build_runner build
// flutter pub run build_runner watch
@freezed
@JsonSerializable()
class Pokemon with _$Pokemon {
  factory Pokemon({
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'url') required String url,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    try {
      return _$PokemonFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('Pokemon.fromJson()');
  }
}