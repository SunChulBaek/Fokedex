import '../../data/model/network_named_api_resource.dart';
import '../../util/converter.dart';

class PokemonItemEntity {
  PokemonItemEntity({
    required this.id,
    required this.index,
    required this.name
  });
  final int id;
  final int index;
  final String name;

  factory PokemonItemEntity.fromNetworkModel(
    int index,
    NetworkNamedAPIResource item
  ) => PokemonItemEntity(
    id: getIdFromUrl(item.url),
    index: index,
    name: item.name
  );
}