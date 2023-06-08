import 'package:flutter/material.dart';

import 'home_content.dart';

// 참고 : https://dopble2k.tistory.com/9
class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.title,
    required this.onClickMon,
    super.key,
  });

  static const routeName = "/home";

  final String title;
  final void Function(BuildContext context, Object param) onClickMon;

  @override
  State<HomeScreen> createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: const Color(0xFFede7f6),
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: HomeContent(onClickItem: widget.onClickMon)
        ),
      )
    );
  }
}