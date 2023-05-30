import 'package:freezed_annotation/freezed_annotation.dart';

import '../../util/timber.dart';
import 'network_chain_link.dart';

part 'network_evolution_chain.freezed.dart';
part 'network_evolution_chain.g.dart';

@freezed
@JsonSerializable()
class NetworkEvolutionChain with _$NetworkEvolutionChain {
  factory NetworkEvolutionChain({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'chain') required NetworkChainLink chain,
  }) = _NetworkEvolutionChain;

  factory NetworkEvolutionChain.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkEvolutionChainFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkEvolutionChain.fromJson()');
  }
}