import 'package:flutter/material.dart';

class ThemeChoose {
  final String theme;
  Color backgroundColor;
  final AssetImage backgroundImage;
  bool isDispo;

  ThemeChoose(
      {required this.theme,
      required this.backgroundColor,
      required this.backgroundImage,
      required this.isDispo});
}
