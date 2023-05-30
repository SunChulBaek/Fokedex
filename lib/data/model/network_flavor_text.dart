import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/timber.dart';
import 'network_named_api_resource.dart';

part 'network_flavor_text.freezed.dart';
part 'network_flavor_text.g.dart';

@freezed
@JsonSerializable()
class NetworkFlavorText with _$NetworkFlavorText {
  factory NetworkFlavorText({
    @JsonKey(name: 'flavor_text') required String flavorText,
    @JsonKey(name: 'language') required NetworkNamedAPIResource language,
    @JsonKey(name: 'version') required NetworkNamedAPIResource version,
  }) = _NetworkFlavorText;

  factory NetworkFlavorText.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkFlavorTextFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkPokemonSpecies.fromJson()');
  }
}