import 'package:flutter/material.dart';

int getIdFromUrl(String url) => int.parse(url.split('/').elementAt(6));

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