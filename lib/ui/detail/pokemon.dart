import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/ui/detail/pokemon_detail_loading_progress.dart';
import 'package:flutter_template/ui/model/ui_pokemon_detail.dart';

import '../../bloc/get_pokemon_cubit.dart';
import '../../bloc/model/ui_pokemon_detail_data.dart';
import '../../bloc/model/ui_state.dart';
import '../../injectable.dart';
import '../common/cancel_button.dart';
import '../model/ui_pokemon_detail_item.dart';
import 'pokemon_bg.dart';

class PokemonParam {
  PokemonParam({
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

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({
    required this.param,
    required this.onClick,
    required this.onBack,
    Key? key
  }) : super(key: key);

  static const routeName = "/pokemon";

  final PokemonParam param;
  final void Function(BuildContext context, Object param) onClick;
  final void Function() onBack;

  @override
  State<StatefulWidget> createState() => _PokemonState();
}

class _PokemonState extends State<PokemonScreen> {
  final GetPokemonCubit _getPokemonCubit = getIt<GetPokemonCubit>();

  @override
  void initState() {
    super.initState();
    _getPokemonCubit.init(widget.param.id, widget.param.title);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _getPokemonCubit,
      child: BlocBuilder<GetPokemonCubit, UiState>(
        builder: (context, state) {
          UiPokemonDetail? pokemon;
          List<UiPokemonDetailItem> items = List.of([]);
          if (state is Success) {
            final data = (state as Success<UiPokemonDetailData>).data;
            pokemon = data.pokemon;
            items = data.items;
          }
          return Scaffold(
            backgroundColor: Colors.lightBlue.shade100, // 100
            body: SafeArea(
              child: Stack(
                children:[
                  const PokemonBg(),
                  Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (BuildContext context, int index) =>
                            items[index].itemContent(onClick: widget.onClick)
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
                        child: CancelButton(onClick : widget.onBack)
                      )
                    )
                  )
                ]
              )
            )
          );
        }
      )
    );
  }

  @override
  void dispose() {
    _getPokemonCubit.dispose();
    super.dispose();
  }
}