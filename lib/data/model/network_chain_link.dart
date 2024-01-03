import 'package:freezed_annotation/freezed_annotation.dart';

import 'network_evolution_detail.dart';
import 'network_named_api_resource.dart';

part 'network_chain_link.freezed.dart';
part 'network_chain_link.g.dart';

@freezed
class NetworkChainLink with _$NetworkChainLink {
  factory NetworkChainLink({
    @JsonKey(name: 'is_baby') required bool isBaby,
    @JsonKey(name: 'species') required NetworkNamedAPIResource species,
    @JsonKey(name: 'evolution_details') required List<NetworkEvolutionDetail> evolutionDetails,
    @JsonKey(name: 'evolves_to') required List<NetworkChainLink> evolvesTo,
  }) = _NetworkChainLink;

  factory NetworkChainLink.fromJson(Map<String, dynamic> json)
    => _$NetworkChainLinkFromJson(json);
}