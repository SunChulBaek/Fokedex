import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/get_pokemon_cubit.dart';
import 'package:flutter_template/bloc/model/ui_state.dart';
import 'package:flutter_template/injectable.dart';
import 'package:flutter_template/ui/model/ui_pokemon_detail.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

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
  const PokemonScreen({Key? key, required this.param}) : super(key: key);

  static const routeName = "/pokemon";

  final PokemonParam param;

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
            backgroundColor: const Color(0xFF212121),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBar(
                  title: Text('#${NumberFormat('000').format(widget.param.id)}'),
                  leading: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                  backgroundColor: Color(widget.param.colorStart),
                ),
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [ Color(widget.param.colorStart), Color(widget.param.colorEnd) ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter
                      )
                    ),
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
                                child: CircularProgressIndicator()
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
                  )
                ),
                // 이름
                Align(
                  alignment: Alignment.center,
                  child: Text(widget.param.title, style: const TextStyle(fontSize: 16, color: Colors.white))
                ),
                // 타입
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    ...pokemon?.types.map((type) =>
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          color: type.color,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 8),
                            child: Text(
                              type.name,
                              style: const TextStyle(color: Colors.white)
                            )
                          )
                        )
                      )
                    ).toList() ?? List.empty(),
                    Expanded(child: Container()),
                  ],
                ),
                // 몸무게, 키
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Container()),
                    Column(children: [
                      Text(
                        '${NumberFormat('#,##0.0').format((pokemon?.weight.toDouble() ?? 0) / 10)} KG',
                        style: const TextStyle(color: Colors.white)
                      ),
                      const Text('Weight', style: TextStyle(color: Colors.white))
                    ]),
                    Expanded(child: Container()),
                    Column(children: [
                      Text(
                        '${NumberFormat('#,##0.0').format((pokemon?.height.toDouble() ?? 0) / 10)} M',
                        style: const TextStyle(color: Colors.white)
                      ),
                      const Text('Height', style: TextStyle(color: Colors.white))
                    ]),
                    Expanded(child: Container()),
                  ],
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text('Base Stats', style: TextStyle(fontSize: 16, color: Colors.white))
                ),
                // 스탯
                ...pokemon?.stats.map((stat) =>
                  Row(
                    children: [
                      Text(stat.name, style: const TextStyle(color: Colors.white)),
                      const SizedBox(width: 10),
                      Text(stat.value.toString(), style: const TextStyle(color: Colors.white)),
                    ],
                  )
                ).toList() ?? List.empty()
              ]
            )
          );
        }
      )
    );
  }
}