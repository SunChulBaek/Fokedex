import 'package:flutter_template/data/model/network_named_api_resource.dart';
import 'package:flutter_template/data/model/network_pokemon_type.dart';
import 'package:flutter_template/util/timber.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_evolution_detail.freezed.dart';
part 'network_evolution_detail.g.dart';

@freezed
@JsonSerializable()
class NetworkEvolutionDetail with _$NetworkEvolutionDetail {
  factory NetworkEvolutionDetail({
    @JsonKey(name: 'item') required NetworkNamedAPIResource item,
  }) = _NetworkEvolutionDetail;

  factory NetworkEvolutionDetail.fromJson(Map<String, dynamic> json) {
    try {
      return _$NetworkEvolutionDetailFromJson(json);
    } catch (e) {
      Timber.e(e);
    }
    throw Exception('NetworkEvolutionDetail.fromJson()');
  }
}