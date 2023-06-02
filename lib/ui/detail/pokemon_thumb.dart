import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/ui/common/pokemon_progress_indicator.dart';

class PokemonThumb extends StatefulWidget {
  const PokemonThumb({
    required this.id,
    required this.size,
    required this.normalColor,
    required this.accentColor,
    required this.isActive,
    required this.onClick,
    super.key
  });

  final int id;
  final double size;
  final Color normalColor;
  final Color accentColor;
  final bool Function() isActive;
  final void Function() onClick;

  @override
  State<PokemonThumb> createState() => _PokemonThumbState();
}

class _PokemonThumbState extends State<PokemonThumb> {

  bool _showProgress = true;

  @override
  Widget build(BuildContext context) {
    // 300ms 이후에 프로그레스 제거 (이미지 로딩 완료 시점을 잡을 수 있으면 완료 이후 제거)
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _showProgress = false;
      });
    });

    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.size / 2),
      child: Container(
        width: widget.size,
        height: widget.size,
        color: widget.isActive() ? widget.accentColor : widget.normalColor,
        child: Stack(
          children: [
            Center(
              child: Container(
                width: widget.size - 20,
                height: widget.size - 20,
                child: CachedNetworkImage(
                  imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/${widget.id}.png",
                  fit: BoxFit.fitWidth,
                )
              )
            ),
            if (_showProgress)
              PokemonProgressIndicator(size: widget.size)
          ],
        )
      ),
    );
  }
}