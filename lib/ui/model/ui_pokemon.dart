import 'package:flutter_template/data/model/pokemon.dart';

class UiPokemon {
  UiPokemon({
    required this.id,
    required this.name,
    required this.imageUrl
  });

  final int id;
  final String name;
  final String imageUrl;

  factory UiPokemon.from(Pokemon pokemon) {
    int id = int.parse(pokemon.url.split("/")[6]);
    String imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";

    return UiPokemon(id: id, name: pokemon.name, imageUrl: imageUrl);
  }
}