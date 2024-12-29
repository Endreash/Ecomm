import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> with SingleTickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(
  duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);
  bool _isFavorite = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
        _controller
            .reverse()
            .then((value) => _controller.forward());
      },
      child: ScaleTransition(
        scale: Tween(begin: 0.7, end: 1.0).animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOut)),
        child: _isFavorite
            ? const Icon(
          Icons.favorite,
          size: 30,
          color: Colors.red,
        )
            : const Icon(
          Icons.favorite_border,
          color: Colors.grey,
          size: 30,
        ),
      ),
    );
  }
}