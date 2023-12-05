import '../util/converter.dart';
import '../util/timber.dart';
import 'model/network_flavor_text.dart';
import 'model/network_name.dart';
import 'model/network_named_api_resource.dart';
import 'model/network_pokemon_species_variety.dart';

class TypeConverter {
  static const _delimiter = "@";
  static const _subDelimiter = "=";

  static String namesToString(List<NetworkName> names) {
    try {
      Timber.i("TypeConverter.namesToString()");
      return names.fold("", (acc, name) =>
        "$acc$_delimiter${name.language.name}$_subDelimiter${name.name}"
      );
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.namesToString()");
    }
  }

  static List<NetworkName> stringToNames(String string) {
    try {
      Timber.i("TypeConverter.stringToNames()");
      return string.split(_delimiter).where((e) => e.isNotEmpty).map((e) =>
        NetworkName(
          name: e.split(_subDelimiter)[1],
          language: NetworkNamedAPIResource(
            name: e.split(_subDelimiter)[0],
            url: ""
          )
        )
      ).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.stringToNames()");
    }
  }

  static String flavorsToString(List<NetworkFlavorText> flavors) {
    try {
      Timber.i("TypeConverter.flavorsToString()");
      return flavors.fold("", (acc, flavor) {
        return "$acc$_delimiter${flavor.version.name}$_subDelimiter${flavor.language.name}$_subDelimiter${flavor.flavorText}";
      });
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.flavorsToString()");
    }
  }

  static List<NetworkFlavorText> stringToFlavors(String string) {
    try {
      Timber.i("TypeConverter.stringToFlavors()");
      return string.split(_delimiter).where((e) => e.isNotEmpty).map((e) {
        return NetworkFlavorText(
          flavorText: e.split("=")[2],
          language: NetworkNamedAPIResource(
            name: e.split(_subDelimiter)[1],
            url: ""
          ),
          version: NetworkNamedAPIResource(
            name: e.split(_subDelimiter)[0],
            url: ""
          )
        );
      }
      ).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.stringToFlavors()");
    }
  }

  static String varietiesToString(List<NetworkPokemonSpeciesVariety> varieties) {
    try {
      Timber.i("TypeConverter.varietiesToString()");
      return varieties.fold("", (acc, e) => "$acc$_delimiter${getIdFromUrl(e.pokemon.url)}");
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.varietiesToString()");
    }
  }

  static List<NetworkPokemonSpeciesVariety> stringToVarieties(String string) {
    try {
      return string.split(_delimiter).where((e) => e.isNotEmpty).map((e) {
        Timber.i("TypeConverter.stringToVarieties()");
        return NetworkPokemonSpeciesVariety(
          isDefault: true,
          pokemon: NetworkNamedAPIResource(
            name: "",
            url: "https://pokeapi.co/api/v2/evolution-chain/$e/"
          )
        );
      }
      ).toList();
    } on Error catch (e) {
      Timber.e(e.stackTrace);
      throw Exception("TypeConverter.stringToVarieties()");
    }
  }
}