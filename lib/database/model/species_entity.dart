import 'lang_value.dart';
import 'lang_value_version.dart';
import '../../data/model/network_pokemon_species.dart';
import '../../util/converter.dart';

class SpeciesEntity {
  SpeciesEntity({
    required this.id,
    required this.names,
    required this.flavorTexts,
    this.ecId,
    this.vIds,
  });

  final int id;
  final List<LangValue> names;
  final List<LangValueVersion> flavorTexts;
  final int? ecId;
  final List<int>? vIds;

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
}