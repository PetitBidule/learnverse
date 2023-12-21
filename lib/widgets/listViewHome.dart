import 'package:flutter/material.dart';

class ThemeChooseHome extends StatelessWidget {
  const ThemeChooseHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      width: 200,
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(44),
          image: const DecorationImage(
              image: AssetImage("asset/image/onePiece.jpeg"),
              fit: BoxFit.cover)),
      child: Stack(children: [
        const Text("4.5"),
        Positioned(
          bottom: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Manga".toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
              const Text("One Piece", style: TextStyle(color: Colors.white)),
            ],
          ),
        )
      ]),
    );
  }
}
