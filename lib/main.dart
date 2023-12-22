import 'package:flutter/material.dart';
import 'package:learnverse/screen/homeTheme.dart';
import 'package:learnverse/screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenLog(),
    );
  }
}
