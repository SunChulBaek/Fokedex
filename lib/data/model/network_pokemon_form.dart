import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_name.dart';

part 'network_pokemon_form.freezed.dart';
part 'network_pokemon_form.g.dart';

@freezed
class NetworkPokemonForm with _$NetworkPokemonForm {
  factory NetworkPokemonForm({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'form_names') required List<NetworkName> formNames,
  }) = _NetworkPokemonForm;

  factory NetworkPokemonForm.fromJson(Map<String, dynamic> json)
    => _$NetworkPokemonFormFromJson(json);
}