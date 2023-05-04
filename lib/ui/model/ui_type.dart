import 'package:flutter/material.dart';

enum UiType {
  normal(Color(0xFF9E9E9E)),
  fighting(Color(0xFF9E9E9E)),
  flying(Color(0xFF607D8B)),
  poison(Color(0xFF673AB7)),
  rock(Color(0xFF9E9E9E)),
  bug(Color(0xFF4CAF50)),
  ghost(Color(0xFF9E9E9E)),
  steel(Color(0xFF9E9E9E)),
  fire(Color(0xFFF44336)),
  water(Color(0xFF3F51B5)),
  grass(Color(0xFF4CAF50)),
  electric(Color(0xFFCDDC39)),
  psychic(Color(0xFF9C27B0)),
  ice(Color(0xFF9E9E9E)),
  dragon(Color(0xFF009688)),
  dark(Color(0xFF9E9E9E)),
  fairy(Color(0xFF9E9E9E)),
  shadow(Color(0xFF9E9E9E)),
  unknown(Color(0xFF9E9E9E));


  const UiType(this.color);

  final Color color;
}