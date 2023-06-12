import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/ui/detail/pokemon_bg.dart';
import 'package:flutter_template/util/converter.dart';
import 'package:intl/intl.dart';

import '../../bloc/get_pokemon_cubit.dart';
import '../../bloc/model/ui_state.dart';
import '../../injectable.dart';
import '../common/pokemon_progress_indicator.dart';
import '../model/ui_pokemon_detail.dart';
import 'pokemon_evolution_chain.dart';
import 'pokemon_varieties.dart';

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
    Key? key
  }) : super(key: key);

  static const routeName = "/pokemon";

  final PokemonParam param;
  final void Function(BuildContext context, Object param) onClick;

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
          UiPokemonDetail? pokemon;
          if (state is Success) {
            pokemon = (state as Success<UiPokemonDetail>).data;
          }
          return Scaffold(
            backgroundColor: Colors.lightBlue.shade100, // 100
            body: SafeArea(
              child: Stack(
                children:[
                  const PokemonBg(),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          height: 200,
                          child: Hero(
                            tag: widget.param.id,
                            child: CachedNetworkImage(
                              imageUrl: widget.param.url,
                              fit: BoxFit.fitWidth,
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
                        ),
                        // 이름
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            getFullName(widget.param.id, widget.param.title, pokemon?.name, pokemon?.form),
                            style: const TextStyle(fontSize: 16, color: Colors.white)
                          )
                        ),
                        // 스테이터스
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Row(
                            children: [
                              Text("몸무게: ${NumberFormat("#,##0.0").format((pokemon?.weight ?? 0)/10)}kg", style: const TextStyle(color: Colors.white)),
                              Expanded(child: Container()),
                              Text("키: ${NumberFormat("#,##0.0").format((pokemon?.height ?? 0)/10)}m", style: const TextStyle(color: Colors.white)),
                              Expanded(child: Container()),
                              Text("타입: ${pokemon?.types.map((type) => type.name)}", style: const TextStyle(color: Colors.white))
                            ],
                          )
                        ),
                        Text(
                          pokemon?.flavorText ?? "",
                          style: const TextStyle(fontSize: 16, color: Colors.white)
                        ),
                        if (maxEvolutionChainLength(pokemon) > 1)
                          const Align(
                            alignment: Alignment.center,
                            child: Text('Evolution Chains', style: TextStyle(fontSize: 16, color: Colors.white))
                          ),
                        if (maxEvolutionChainLength(pokemon) > 1)
                          PokemonEvolutionChain(
                            pokemon: pokemon!,
                            size: 60,
                            normalColor: const Color(0xFFbdbdbd),
                            accentColor: const Color(0xFFc6ff00),
                            onClick: widget.onClick
                          ),
                        if ((pokemon?.varietyIds.length ?? 0) > 1)
                          const Align(
                              alignment: Alignment.center,
                              child: Text('Varieties', style: TextStyle(fontSize: 16, color: Colors.white))
                          ),
                        if ((pokemon?.varietyIds.length ?? 0) > 1)
                          PokemonVarieties(
                            pokemon: pokemon!,
                            onClick: widget.onClick,
                          )
                       ]
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