import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_template/injectable.dart';
import 'package:flutter_template/ui/detail/photo.dart';
import 'package:flutter_template/ui/detail/webview.dart';
import 'package:flutter_template/ui/home/home_screen.dart';
import 'package:go_router/go_router.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Fokedex',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        primarySwatch: Colors.indigo,
        useMaterial3: true,
        splashFactory: InkRipple.splashFactory,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          }
        ),
      ),
      routerConfig: GoRouter(
        initialLocation: '/home',
        routes: [
          GoRoute(
            path: '/home',
            name: HomeScreen.routeName,
            builder: (context, state) => HomeScreen(
              title: 'Fokedex',
              onClickMon: (context, param) {
                context.pushNamed(PokemonScreen.routeName, extra: param as PokemonParam);
              },
            )
          ),
          GoRoute(
            path: '/product',
            name: PokemonScreen.routeName,
            builder: (context, state) => PokemonScreen(param: state.extra as PokemonParam),
          ),
          GoRoute(
            path: '/webview',
            name: WebViewScreen.routeName,
            builder: (context, state) => WebViewScreen(param: state.extra as WebViewParam),
          ),
        ]
      ),
    );
  }
}