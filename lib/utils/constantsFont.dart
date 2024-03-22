import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learnverse/utils/constantsColors.dart';

class AllConstants {
  static const Color backgroundContainer = Color.fromRGBO(117, 123, 200, 1);
  static const TextStyle title = TextStyle(
      fontSize: 33, fontWeight: FontWeight.w400, color: Color(0xFFFFFAFA));
  static const TextStyle subtitle = TextStyle(
      fontSize: 16, fontWeight: FontWeight.normal, color: Color(0xFFFFFAFA));
  static const TextStyle text = TextStyle(
      fontSize: 14, fontWeight: FontWeight.normal, color: Color(0xFFFFFAFA));
  static const TextStyle placeholder = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: Color.fromARGB(186, 255, 255, 255));
  static const TextStyle textBtn = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      color: ConstantsColors.blackColors);
}
