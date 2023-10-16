import 'package:flutter/material.dart';
import 'package:flutter_template/ui/model/ui_pokemon_detail.dart';

class PokemonDetailLoadingProgress extends StatelessWidget {
  const PokemonDetailLoadingProgress({
    required this.pokemon,
    super.key
  });

  final UiPokemonDetail? pokemon;

  @override
  Widget build(BuildContext context) => Container(
    height: 10,
    color: Colors.grey,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: pokemon?.weight != null ? Colors.green : Colors.transparent,
              border: Border.all(width: 1)
            ),
            child: const Text('pokemon', style: TextStyle(fontSize: 7))
          )
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: pokemon?.flavorText != null ? Colors.green : Colors.transparent,
              border: Border.all(width: 1)
            ),
            child: const Text('species', style: TextStyle(fontSize: 7))
          )
        ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: pokemon?.form != null ? Colors.green : Colors.transparent,
              border: Border.all(width: 1)
            ),
            child: const Text('form', style: TextStyle(fontSize: 7))
          )
        ),
        for (var i = 0; i < (pokemon?.types?.length ?? 0); i++)
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                color: pokemon?.types?[i].name.isNotEmpty == true ? Colors.green : Colors.transparent,
                border: Border.all(width: 1)
              ),
              child: const Text('type', style: TextStyle(fontSize: 7))
            )
          ),
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              color: pokemon?.chains != null ? Colors.green : Colors.transparent,
              border: Border.all(width: 1)
            ),
            child: Text('evolution', style: TextStyle(fontSize: 7))
          )
        ),
      ]
  ));
}