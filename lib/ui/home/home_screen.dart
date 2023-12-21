import 'package:flutter/material.dart';
import 'package:fokedex/util/timber.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../common/s_dialog.dart';
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
  static const colorFromInternet = Color(0xFF4caf50);
  static const colorFromDB = Color(0xFF3f51b5);

  late HomeViewModel _viewModel;
  DateTime? currentBackPressTime;
  final ScrollController _scrollController = ScrollController();

  final TextEditingController _editingController = TextEditingController();
  String? search;

  late final PackageInfo _packageInfo;

  @override
  void initState() {
    super.initState();
    _viewModel = context.read<HomeViewModel>();
    initFuture();
  }

  Future<void> initFuture() async {
    _packageInfo = await PackageInfo.fromPlatform();
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
          actions: [
            IconButton(
              onPressed: () {
                SDialog(
                  title: "Pokedex with Flutter",
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("v${_packageInfo.version}(${_packageInfo.buildNumber})"),
                      const Text("https://github.com/SunChulBaek/Fokedex")
                    ]
                  ),
                  positiveButton: "확인",
                ).show(context);
              },
              icon: const Icon(
                Icons.info,
                color: Colors.white
              )
            )
          ],
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
                  child: Column(
                    children: [
                      // TODO : 검색 동작
                      Container(
                        color: Colors.white,
                        child: TextField(
                          controller: _editingController,
                          decoration: InputDecoration(
                            hintText: "Search (Name or Number)",
                            suffixIcon: search?.isNotEmpty == true ? IconButton(
                              onPressed: () {
                                _editingController.clear();
                                setState(() {
                                  search = null;
                                  _viewModel.init();
                                });
                              },
                              icon: const Icon(Icons.close)
                            ) : null
                          ),
                          onChanged: (text) {
                            setState(() {
                              search = text;
                              _viewModel.init(search: text);
                            });
                          },
                        )
                      ),
                      Expanded(
                        flex: 1,
                        child: (pokemonList?.isEmpty ?? true)
                            ? const Center(child: Text('No pokemon!'))
                            : Scrollbar(
                                thumbVisibility: true,
                                controller: _scrollController,
                                child: NotificationListener<ScrollNotification>(
                                  onNotification: (ScrollNotification scrollInfo) {
                                    if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                                      _viewModel.init(offset: pokemonList.length, limit: 60);
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
                    ]
                )
                )
              ),
              SizedBox(
                height: 10,
                child: Row(
                  children: [
                    if ((pokemonList?.where((e) => e.fromDB).length ?? 0) > 0)
                      Expanded(
                        flex: pokemonList?.where((e) => e.fromDB).length ?? 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorFromDB,
                            border: Border.all(width: 1)
                          ),
                          child: Text(
                            "fromDB(${pokemonList?.where((e) => e.fromDB).length})",
                            style: const TextStyle(fontSize: 7)
                          )
                        )
                      ),
                    if ((pokemonList?.where((e) => !e.fromDB).length ?? 0) > 0)
                      Expanded(
                        flex: pokemonList?.where((e) => !e.fromDB).length ?? 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: colorFromInternet,
                            border: Border.all(width: 1)
                          ),
                          child: Text(
                            "fromAPI(${pokemonList?.where((e) => !e.fromDB).length})",
                            style: const TextStyle(fontSize: 7)
                          )
                        )
                      )
                  ],
                ),
              )
            ]
          )
        ),
      )
    );
  }
}