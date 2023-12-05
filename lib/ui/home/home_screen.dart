import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'bottom_loader.dart';
import 'home_view_model.dart';
import 'pokemon_list_item.dart';
import '../common/state_view.dart';
import '../model/ui_state.dart';
import '../../data/pokemon_repository.dart';
import '../../injectable.dart';

// 참고 : https://dopble2k.tistory.com/9
class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.title,
    required this.onClickMon,
    super.key,
  });

  static const routeName = "/home";

  final String title;
  final void Function(BuildContext context, Object param) onClickMon;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (_) => HomeViewModel(getIt<PokemonRepository>())..init(),
    child: _HomeContent(title: title, onClickMon: onClickMon)
  );
}

class _HomeContent extends StatefulWidget {
  const _HomeContent({
    required this.title,
    required this.onClickMon,
  });

  final String title;
  final void Function(BuildContext context, Object param) onClickMon;

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<_HomeContent> {
  late HomeViewModel _viewModel;
  DateTime? currentBackPressTime;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<HomeViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeViewModel>().uiState;
    final pokemonList = state is Success ? (state as Success<PokemonListData>).data.pokemonList : null;
    return WillPopScope(
      onWillPop: () {
        DateTime now = DateTime.now();
        if (currentBackPressTime == null ||
            now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
          currentBackPressTime = now;
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('\'뒤로\' 버튼 한번 더 누르시면 종료됩니다.'))
          );
          return Future.value(false);
        }
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Colors.lightBlue.shade50, // 50
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Column(
            children: [
              // HomeShortcuts(
              //   shortcuts: List.of([778, 10044, 10196, 10157, 936, 135, 269, 792]),
              //   onClickItem: widget.onClickItem
              // ),
              Expanded(
                child: StateView(
                  state: state,
                  child: (pokemonList?.isEmpty ?? true)
                    ? const Center(child: Text('No pokemon!'))
                    : Scrollbar(
                    thumbVisibility: true,
                    controller: _scrollController,
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (ScrollNotification scrollInfo) {
                        if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                          _viewModel.init(offset: pokemonList.length);
                        }
                        return true;
                      },
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5
                        ),
                        controller: _scrollController,
                        padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                        itemBuilder: (BuildContext context, int index) {
                          return index >= pokemonList.length
                            ? const BottomLoader()
                            : PokemonGridItem(
                            pokemon: pokemonList[index],
                            onClick: widget.onClickMon
                          );
                        },
                        itemCount: pokemonList!.length,
                      )
                    )
                  )
                )
              )
            ]
          )
        ),
      )
    );
  }
}