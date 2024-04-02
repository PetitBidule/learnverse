import 'package:flutter/material.dart';

class MostPopularCategory {
  final String name;
  final String categories;
  final int note;
  final String backgroundImage;
  final Color backGroundColor;

  MostPopularCategory(
      {required this.name,
      required this.note,
      required this.categories,
      required this.backgroundImage,
      required this.backGroundColor});
}
