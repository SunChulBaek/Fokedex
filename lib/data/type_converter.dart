import 'model/network_flavor_text.dart';
import 'model/network_name.dart';
import 'model/network_named_api_resource.dart';

class TypeConverter {

  static String namesToString(List<NetworkName> names) =>
    names
      .fold("", (acc, name) =>
        "$acc:${name.language.name}=${name.name}"
      );

  static List<NetworkName> stringToNames(String string) =>
    string.split(":").where((e) => e.isNotEmpty).map((e) =>
      NetworkName(
        name: e.split("=")[1],
        language: NetworkNamedAPIResource(
          name: e.split("=")[0],
          url: ""
        )
      )
    ).toList();

  static String flavorsToString(List<NetworkFlavorText> flavors) =>
    flavors
      .fold("", (acc, flavor) =>
        "$acc:${flavor.language.name}=${flavor.flavorText}=${flavor.version.name}"
    );

  static List<NetworkFlavorText> stringToFlavors(String string) =>
    string.split(":").where((e) => e.isNotEmpty).map((e) =>
      NetworkFlavorText(
        flavorText: e.split("=")[1],
        language: NetworkNamedAPIResource(
          name: e.split("=")[0],
          url: ""
        ),
        version: NetworkNamedAPIResource(
          name: e.split("=")[2],
          url: ""
        )
      )
    ).toList();
}