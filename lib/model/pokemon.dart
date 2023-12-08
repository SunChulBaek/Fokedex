import 'loadable.dart';
import '../database/model/pokemon_item_entity.dart';

class Pokemon extends Loadable {
  Pokemon({
    required int id,
    required this.name,
    required this.imageUrl,
    bool fromDB = false,
  }) : super(id, fromDB);

  final String name;
  final String imageUrl;

  factory Pokemon.fromEntity(
    PokemonItemEntity pokemon,
    {
      bool fromDB = false,
    }
  ) {
    String imageUrl = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${pokemon.id}.png";

    return Pokemon(
      id: pokemon.id,
      name: pokemon.name,
      imageUrl: imageUrl,
      fromDB: fromDB
    );
  }
}