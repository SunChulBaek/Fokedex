import '../data/model/network_named_api_resource.dart';
import '../util/converter.dart';
import 'loadable.dart';

class Pokemon extends Loadable {
  Pokemon({
    required int id,
    required this.name,
    required this.imageUrl,
    bool fromDB = false,
  }) : super(id, fromDB);

  final String name;
  final String imageUrl;

  factory Pokemon.from({
    required NetworkNamedAPIResource pokemon,
    bool fromDB = false,
  }) {
    int id = getIdFromUrl(pokemon.url);
    String imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png";

    return Pokemon(
      id: id,
      name: pokemon.name,
      imageUrl: imageUrl,
      fromDB: fromDB
    );
  }
}