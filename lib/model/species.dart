import 'loadable.dart';
import '../database/model/species_entity.dart';
import '../data/model/network_pokemon_species.dart';
import '../util/converter.dart';
import '../util/timber.dart';

class Species extends Loadable {
  Species({
    required int id,
    required this.name,
    required this.flavorText,
    required this.ecId,
    required this.vIds,
    bool fromDB = false,
  }) : super(id, fromDB);

  final String name;
  final String flavorText;
  final int? ecId;
  final List<int>? vIds;

  factory Species.fromEntity(
    SpeciesEntity species,
    {
      bool fromDB = false
    }
  ) {
    return Species(
      id: species.id,
      name: getNameForLocale2(species.names),
      flavorText: getFlavorTextForLocale2(species.flavorTexts),
      ecId: species.ecId,
      vIds: species.vIds,
      fromDB: fromDB
    );
  }

  factory Species.fromNetworkModel(
    NetworkPokemonSpecies species,
    {
      bool fromDB = false
    }
  ) {
    return Species(
      id: species.id,
      name: getNameForLocale(species.names),
      flavorText: getFlavorTextForLocale(species.flavorTextEntries),
      ecId: getIdFromUrl(species.evolutionChain.url),
      vIds: species.varieties.map((e) {
        Timber.i("Species.fromNetworkModel(v = $e)");
        return getIdFromUrl(e.pokemon.url);
      }).toList(),
      fromDB: fromDB
    );
  }
}