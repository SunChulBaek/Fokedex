import 'package:flutter/material.dart';

import '../data/model/network_flavor_text.dart';
import '../data/model/network_name.dart';

int getIdFromUrl(String url) => int.parse(url.split('/').elementAt(6));

String getNameForLocale(List<NetworkName>? names) {
  if (names != null && names.isNotEmpty) {
    return names.firstWhere(
      (name) => name.language.name == 'ko'
      , orElse: () => names.firstWhere(
        (name) => name.language.name == 'en'
        , orElse: () => names.first
      )
    ).name;
  } else {
    return "";
  }
}

String getFlavorTextForLocale(List<NetworkFlavorText>? flavorTexts) {
  if (flavorTexts != null && flavorTexts.isNotEmpty) {
    return flavorTexts.firstWhere(
      (flavorText) => flavorText.language.name == 'ko'
      , orElse: () => flavorTexts.firstWhere(
        (flavorText) => flavorText.language.name == 'en'
        , orElse: () => flavorTexts.first
      )
    ).flavorText.replaceAll("\n", " ");
  } else {
    return "";
  }
}

Color getColorFromId(int id) {
  switch (id) {
    case 1:
      return const Color(0xFF9E9E9E);
    case 3: // flying
      return const Color(0xFF607D8B);
    case 4: // poison
      return const Color(0xFF673AB7);
    case 10: // fire
      return const Color(0xFFF44336);
    case 11: // water
      return const Color(0xFF3F51B5);
    case 12: // grass
      return const Color(0xFF4CAF50);
    case 13: // electric
      return const Color(0xFFCDDC39);
    case 14: // psychic
      return const Color(0xFF9C27B0);
    default:
      return const Color(0xFF9E9E9E);
  };
}