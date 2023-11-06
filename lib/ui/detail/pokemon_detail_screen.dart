import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pokemon_detail_bg.dart';
import 'pokemon_detail_loading_progress.dart';
import 'pokemon_detail_view_model.dart';
import '../common/cancel_button.dart';
import '../../bloc/model/ui_pokemon_detail_data.dart';
import '../../bloc/model/ui_state.dart';
import '../../data/repository.dart';
import '../../injectable.dart';

class PokemonDetailParam {
  PokemonDetailParam({
    required this.id,
    required this.title,
    required this.url,
    required this.colorStart,
    required this.colorEnd,
  });

  final int id;
  final String title;
  final String url;
  final int colorStart;
  final int colorEnd;
}

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({
    required this.param,
    required this.onClick,
    required this.onBack,
    Key? key
  }) : super(key: key);

  static const routeName = "/pokemon";

  final PokemonDetailParam param;
  final void Function(BuildContext context, Object param) onClick;
  final void Function() onBack;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (_) => PokemonDetailViewModel(getIt<Repository>())..init(param.id, param.title),
    child: _PokemonDetailContent(onClick: onClick, onBack: onBack)
  );
}

class _PokemonDetailContent extends StatelessWidget {
  const _PokemonDetailContent({
    required this.onClick,
    required this.onBack
  });

  final void Function(BuildContext context, Object param) onClick;
  final void Function() onBack;

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PokemonDetailViewModel>().uiState;
    final pokemon = state is Success ? (state as Success<UiPokemonDetailData>).data.pokemon : null;
    final items = state is Success ? (state as Success<UiPokemonDetailData>).data.items : null;

    return Scaffold(
      backgroundColor: Colors.lightBlue.shade100, // 100
      body: SafeArea(
        child: Stack(
          children:[
            const PokemonDetailBg(),
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: items?.length ?? 0,
                    itemBuilder: (BuildContext context, int index) =>
                      items![index].itemContent(onClick: onClick)
                  )
                ),
                PokemonDetailLoadingProgress(pokemon: pokemon)
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CancelButton(onClick : onBack)
                )
              )
            )
          ]
        )
      )
    );
  }
}