import 'package:flutter_template/data/model/network_name.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/timber.dart';

part 'network_pokemon_form.freezed.dart';
part 'network_pokemon_form.g.dart';

@freezed
@JsonSerializable()
class NetworkPokemonForm with _$NetworkPokemonForm {
  factory NetworkPokemonForm({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'form_names') required List<NetworkName> formNames,
  }) = _NetworkPokemonForm;

  factory NetworkPokemonForm.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkPokemonFormFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkPokemonForm.fromJson()');
  }
}