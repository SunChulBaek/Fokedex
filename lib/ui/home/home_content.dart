import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/bloc/model/ui_state.dart';
import 'package:flutter_template/injectable.dart';
import 'package:flutter_template/ui/common/state_view.dart';
import 'package:flutter_template/bloc/get_pokemon_list_cubit.dart';
import 'package:flutter_template/ui/home/bottom_loader.dart';
import 'package:flutter_template/ui/home/pokemon_list_item.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key, required this.onClickItem}) : super(key: key);

  final void Function(BuildContext context, Object param) onClickItem;

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<HomeContent> {
  final GetPokemonListCubit _getPokemonListCubit = getIt<GetPokemonListCubit>()..init();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _getPokemonListCubit,
      child: BlocBuilder<GetPokemonListCubit, UiState>(
        builder: (context, state) {
          final pokemonList = state is Success ? (state as Success<PokemonListData>).data.pokemonList : null;
          return StateView(
            state: state,
            child: (pokemonList?.isEmpty ?? true)
              ? const Center(child: Text('No pokemon!'))
              : Scrollbar(
                  thumbVisibility: true,
                  controller: _scrollController,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: (ScrollNotification scrollInfo) {
                      if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                        _getPokemonListCubit.init(offset: pokemonList.length);
                      }
                      return true;
                    },
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2
                      ),
                      controller: _scrollController,
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      itemBuilder: (BuildContext context, int index) {
                        return index >= pokemonList.length
                          ? const BottomLoader()
                          : PokemonGridItem(
                          pokemon: pokemonList[index],
                          onClick: widget.onClickItem
                        );
                      },
                      itemCount: pokemonList!.length,
                    )
                  )
                )
          );
        }
      )
    );
  }
}