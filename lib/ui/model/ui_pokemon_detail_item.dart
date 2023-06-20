import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/model/ui_type.dart';
import 'package:intl/intl.dart';

import '../common/pokemon_progress_indicator.dart';
import '../detail/pokemon_evolution_chain.dart';
import '../detail/pokemon_varieties.dart';
import 'ui_chain_entry.dart';

abstract class UiPokemonDetailItem {
  Widget itemContent({
    required void Function(BuildContext context, Object param) onClick
  });
}

class UiPokemonDetailImage extends UiPokemonDetailItem {
  UiPokemonDetailImage({required this.id});

  final int id;

  @override
  Widget itemContent({
    required void Function(BuildContext context, Object param) onClick,
  }) => SizedBox(
    width: 200,
    height: 200,
    child: Hero(
      tag: id,
      child: CachedNetworkImage(
        imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/$id.png",
        fit: BoxFit.fitHeight,
        placeholder: (context, url) => AspectRatio(
          aspectRatio: 1,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey,
            child: const Center(
              child: PokemonProgressIndicator(size: 30)
            ),
          )
        ),
        errorWidget: (context, url, error) => const AspectRatio(
          aspectRatio: 1,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Icon(Icons.error, color: Colors.red),
            ),
          )
        ),
      )
    )
  );
}

class UiPokemonDetailName extends UiPokemonDetailItem {
  UiPokemonDetailName({
    required this.id,
    required this.defaultName,
    this.name,
    this.form,
  });

  final int id;
  final String defaultName;
  String? name;
  String? form;

  @override
  Widget itemContent({
    required void Function(BuildContext context, Object param) onClick,
  }) => Align(
    alignment: Alignment.center,
    child: Text(
      getFullName(id, defaultName, name, form),
      style: TextStyle(
        fontSize: (form != null && form!.isNotEmpty) ? 20 : 30,
        color: Colors.white
      )
    )
  );

  String getFullName(int id, String? defaultName, String? name, String? form) {
    if (name != null && form != null && form.isNotEmpty) {
      return "${NumberFormat('0000').format(id)} $name ($form)";
    } else if (name != null && (form == null || form.isEmpty)) {
      return "${NumberFormat('0000').format(id)} $name";
    } else {
      return "${NumberFormat('0000').format(id)} ${defaultName ?? ""}";
    }
  }
}

class UiPokemonDetailStat extends UiPokemonDetailItem {
  UiPokemonDetailStat({
    required this.weight,
    required this.height,
    required this.types,
  });

  final int weight;
  final int height;
  final List<UiType> types;

  @override
  Widget itemContent({
    required void Function(BuildContext context, Object param) onClick,
  }) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 40),
    child: Row(
      children: [
        Text(
          "몸무게: ${NumberFormat("#,##0.0").format(weight / 10)}kg",
          style: const TextStyle(color: Colors.white)
        ),
        Expanded(child: Container()),
        Text(
          "키: ${NumberFormat("#,##0.0").format(height / 10)}m",
          style: const TextStyle(color: Colors.white)
        ),
        Expanded(child: Container()),
        Text(
          "타입: ${types.map((type) => type.name)}",
          style: const TextStyle(color: Colors.white)
        )
      ],
    )
  );
}

class UiPokemonDetailFlavorText extends UiPokemonDetailItem {
  UiPokemonDetailFlavorText({
    required this.flavorText,
  });

  final String flavorText;

  @override
  Widget itemContent({
    required void Function(BuildContext context, Object param) onClick,
  }) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    child: Text(
      flavorText,
      style: const TextStyle(fontSize: 16, color: Colors.white)
  ));
}

class UiPokemonDetailEvolutionChains extends UiPokemonDetailItem {
  UiPokemonDetailEvolutionChains({
    required this.pId,
    required this.chains,
  });

  final int pId;
  final List<List<UiChainEntry>> chains;

  @override
  Widget itemContent({
    required void Function(BuildContext context, Object param) onClick,
  }) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Container(
            color: Colors.white,
            height: 1,
          )),
        const SizedBox(height: 10),
        const Align(
          alignment: Alignment.center,
          child: Text(
            'Evolution Chains',
            style: TextStyle(fontSize: 16, color: Colors.white)
          )
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: PokemonEvolutionChain(
            pId: pId,
            chains: chains,
            size: 60,
            normalColor: const Color(0xFFbdbdbd),
            accentColor: const Color(0xFFc6ff00),
            onClick: onClick
          ))
      ]
    )
  );
}

class UiPokemonDetailVarieties extends UiPokemonDetailItem {
  UiPokemonDetailVarieties({
    required this.pId,
    required this.varietyIds,
  });

  final int pId;
  final List<int> varietyIds;

  @override
  Widget itemContent({
    required void Function(BuildContext context, Object param) onClick,
  }) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child:Column(
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Container(
            color: Colors.white,
            height: 1,
          )),
        const SizedBox(height: 10),
        const Align(
          alignment: Alignment.center,
          child: Text('Varieties', style: TextStyle(fontSize: 16, color: Colors.white))
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: PokemonVarieties(
            pId: pId,
            varietyIds: varietyIds,
            onClick: onClick,
          ))
      ]
    )
  );
}