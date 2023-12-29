import 'package:floor/floor.dart';

import '../../data/model/network_pokemon.dart';
import '../../model/pokemon_detail.dart';
import '../../util/converter.dart';

@Entity(
  tableName: "pokemon",
  primaryKeys: [ "p_id" ]
)
class PokemonEntity {
  PokemonEntity({
    required this.id,
    required this.sId,
    required this.fId,
    required this.name,
    required this.baseExp,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.typeIds,
  });
  @ColumnInfo(name: "p_id")  final int id;
  @ColumnInfo(name: "s_id") final int sId;
  @ColumnInfo(name: "f_id") final int fId;
  @ColumnInfo(name: "name") final String name;
  @ColumnInfo(name: "base_experience") final int baseExp;
  @ColumnInfo(name: "height") final int height;
  @ColumnInfo(name: "is_default") final bool isDefault;
  @ColumnInfo(name: "order") final int order;
  @ColumnInfo(name: "weight") final int weight;
  @ColumnInfo(name: "typeIds") final List<int> typeIds;

  factory PokemonEntity.fromNetworkModel(
    NetworkPokemon pokemon
  ) => PokemonEntity(
    id: pokemon.id,
    sId: getIdFromUrl(pokemon.species.url),
    fId: getIdFromUrl(pokemon.forms.first.url),
    name: pokemon.name,
    baseExp: pokemon.baseExp ?? 0,
    height: pokemon.height ?? 0,
    isDefault: pokemon.isDefault,
    order: pokemon.order ?? 0,
    weight: pokemon.weight ?? 0,
    typeIds: pokemon.types.map((e) =>
      getIdFromUrl(e.type.url)
    ).toList()
  );

  PokemonDetail asExternalModel({
    bool fromDB = false
  }) => PokemonDetail(
    id: id,
    name: name,
    weight: weight,
    height: height,
    formId: fId,
    speciesId: sId,
    totalTypeIds: typeIds,
  );
}