import '../data/model/network_named_api_resource.dart';

class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
  final int id;
  final String name;
  final String imageUrl;

  factory Pokemon.from(NetworkNamedAPIResource pokemon) {
    int id = int.parse(pokemon.url.split("/")[6]);
    String imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";

    return Pokemon(id: id, name: pokemon.name, imageUrl: imageUrl);
  }
}