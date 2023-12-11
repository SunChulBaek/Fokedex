import '../../data/model/network_named_api_resource.dart';
import '../../model/pokemon.dart';
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

  Pokemon asExternalModel({
    bool fromDB = false
  }) => Pokemon(
    id: id,
    name: name,
    imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
    fromDB: fromDB
  );
}