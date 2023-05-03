import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({Key? key, required this.param}) : super(key: key);

  static const routeName = "/pokemon";

  final PokemonParam param;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            title: Text('#${NumberFormat('000').format(param.id)}'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.pop();
              },
            ),
            backgroundColor: Color(param.colorStart),
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50)
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [ Color(param.colorStart), Color(param.colorEnd) ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
                )
              ),
              child: CachedNetworkImage(
                imageUrl: param.url,
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
          ),
          Align(
            alignment: Alignment.center,
            child: Text(param.title, style: const TextStyle(fontSize: 16))
          ),
        ]
      )
    );
  }
}