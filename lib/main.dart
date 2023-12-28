import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'injectable.dart';
import 'ui/detail/pokemon_detail_screen.dart';
import 'ui/detail/webview.dart';
import 'ui/home/home_screen.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  // 참고 : https://me-log.vercel.app/flutter-main-native
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
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
        primaryColor: const Color(0xFF29b6f6),
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
                context.pushNamed(PokemonDetailScreen.routeName, extra: param as PokemonDetailParam);
              },
            )
          ),
          GoRoute(
            path: '/product',
            name: PokemonDetailScreen.routeName,
            builder: (context, state) => PokemonDetailScreen(
              param: state.extra as PokemonDetailParam,
              onClick: (context, param) {
                context.pushNamed(PokemonDetailScreen.routeName, extra: param as PokemonDetailParam);
              },
              onBack: () {
                context.pop();
              },
            ),
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