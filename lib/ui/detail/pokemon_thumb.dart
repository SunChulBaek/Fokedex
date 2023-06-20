import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../common/pokemon_progress_indicator.dart';
import 'pokemon.dart';

class PokemonThumb extends StatefulWidget {
  const PokemonThumb({
    required this.id,
    required this.pId,
    required this.size,
    required this.normalColor,
    required this.accentColor,
    required this.isActive,
    required this.onClick,
    super.key
  });

  final int id;
  final int pId;
  final double size;
  final Color normalColor;
  final Color accentColor;
  final bool Function() isActive;
  final void Function(BuildContext context, Object param) onClick;

  @override
  State<PokemonThumb> createState() => _PokemonThumbState();
}

class _PokemonThumbState extends State<PokemonThumb> {

  bool _showProgress = true;

  @override
  Widget build(BuildContext context) {
    // 300ms 이후에 프로그레스 제거 (이미지 로딩 완료 시점을 잡을 수 있으면 완료 이후 제거)
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        setState(() {
          _showProgress = false;
        });
      }
    });

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.size / 2),
      child: Container(
        width: widget.size,
        height: widget.size,
        color: widget.isActive() ? widget.accentColor : widget.normalColor,
        child: Stack(
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(widget.size / 2),
              child: SizedBox(
                width: widget.size,
                height: widget.size,
                child: Column(
                  children:[
                    Expanded(child: Container()),
                    SizedBox(
                      width: widget.size - 20,
                      height: widget.size - 20,
                      child: CachedNetworkImage(
                        imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.id}.png",
                        fit: BoxFit.cover,
                      )
                    ),
                    Text(
                      "#${NumberFormat("000").format(widget.id)}",
                      style: const TextStyle(fontSize: 10)
                    ),
                    Expanded(child: Container()),
                  ]
                )
              ),
              onTap: () {
                if (widget.id != widget.pId) {
                  widget.onClick(
                    context,
                    PokemonParam(
                      id: widget.id,
                      title: 'name',
                      url: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget
                          .id}.png",
                      colorStart: 0xFFe91e63,
                      colorEnd: 0xFF03a9f4
                    ));
                }
              },
            ),
            if (_showProgress)
              PokemonProgressIndicator(size: widget.size)
          ],
        )
      ),
    );
  }
}