import 'package:flutter/material.dart';

class SquareBackground extends StatelessWidget {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final backgroundSquare;
  const SquareBackground(
      {super.key,
      this.top,
      this.bottom,
      this.left,
      this.right,
      required this.backgroundSquare});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      right: right,
      left: left,
      bottom: bottom,
      child: Container(
        height: 121.926,
        width: 121.926,
        decoration: BoxDecoration(color: backgroundSquare),
      ),
    );
  }
}
