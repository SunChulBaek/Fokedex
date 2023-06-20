import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/get_pokemon_cubit.dart';
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
    _getPokemonCubit.init(widget.param.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _getPokemonCubit,
      child: BlocBuilder<GetPokemonCubit, UiState>(
        builder: (context, state) {
          List<UiPokemonDetailItem> items = List.of([]);
          if (state is Success) {
            items = (state as Success<List<UiPokemonDetailItem>>).data;
          }
          return Scaffold(
            backgroundColor: Colors.lightBlue.shade100, // 100
            body: SafeArea(
              child: Stack(
                children:[
                  const PokemonBg(),
                  ListView.builder(
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) =>
                      items[index].itemContent()
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
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