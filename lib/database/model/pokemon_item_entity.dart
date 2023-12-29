import 'package:floor/floor.dart';

import '../../data/model/network_named_api_resource.dart';
import '../../model/pokemon.dart';
import '../../util/converter.dart';

@Entity(
  tableName: "pokemon_item",
  primaryKeys: [ "id" ]
)
class PokemonItemEntity {
  PokemonItemEntity({
    required this.id,
    required this.index,
    required this.name
  });
  @ColumnInfo(name: "id") final int id;
  @ColumnInfo(name: "indexx") final int index;
  @ColumnInfo(name: "name") final String name;

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