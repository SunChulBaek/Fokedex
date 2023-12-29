import 'package:floor/floor.dart';

import 'lang_value.dart';
import 'lang_value_version.dart';
import '../../data/model/network_pokemon_species.dart';
import '../../model/species.dart';
import '../../util/converter.dart';

@Entity(
  tableName: "species",
  primaryKeys: [ "s_id" ]
)
class SpeciesEntity {
  SpeciesEntity({
    required this.id,
    required this.names,
    required this.flavorTexts,
    this.ecId,
    this.vIds,
  });

  @ColumnInfo(name: "s_id") final int id;
  @ColumnInfo(name: "names") final List<LangValue> names;
  @ColumnInfo(name: "flavor_texts") final List<LangValueVersion> flavorTexts;
  @ColumnInfo(name: "ec_id") final int? ecId;
  @ColumnInfo(name: "v_ids") final List<int>? vIds;

  factory SpeciesEntity.fromNetworkModel(
    NetworkPokemonSpecies species
  ) => SpeciesEntity(
    id: species.id,
    names: species.names.map((e) => LangValue(
      lang: e.language.name,
      value: e.name
    )).toList(),
    flavorTexts: species.flavorTextEntries.map((e) => LangValueVersion(
      lang: e.language.name,
      value: e.flavorText,
      version: e.version.name
    )).toList(),
    ecId: getIdFromUrl(species.evolutionChain.url),
    vIds: species.varieties.map((e) => getIdFromUrl(e.pokemon.url)).toList()
  );

  Species asExternalModel({
    bool fromDB = false
  }) => Species(
    id: id,
    name: getNameForLocale2(names),
    flavorText: getFlavorTextForLocale2(flavorTexts),
    ecId: ecId,
    vIds: vIds,
    fromDB: fromDB
  );
}