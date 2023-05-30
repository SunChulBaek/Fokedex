import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/timber.dart';
import 'network_evolution_detail.dart';

part 'network_chain_link.freezed.dart';
part 'network_chain_link.g.dart';

@freezed
@JsonSerializable()
class NetworkChainLink with _$NetworkChainLink {
  factory NetworkChainLink({
    @JsonKey(name: 'is_baby') required bool isBaby,
    @JsonKey(name: 'evolution_details') required List<NetworkEvolutionDetail> evolutionDetails,
    @JsonKey(name: 'evolves_to') required List<NetworkChainLink> evolvesTo,
  }) = _NetworkChainLink;

  factory NetworkChainLink.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkChainLinkFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkChainLink.fromJson()');
  }
}