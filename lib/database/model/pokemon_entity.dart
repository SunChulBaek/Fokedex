import '../../data/model/network_pokemon.dart';
import '../../model/pokemon_detail.dart';
import '../../util/converter.dart';

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
  final int id;
  final int sId;
  final int fId;
  final String name;
  final int baseExp;
  final int height;
  final bool isDefault;
  final int order;
  final int weight;
  final List<int> typeIds;

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