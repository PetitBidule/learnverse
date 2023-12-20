import 'package:flutter/material.dart';
import 'package:learnverse/screen/login.dart';
import 'package:learnverse/screen/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //       seedColor: const Color.fromARGB(255, 38, 35, 42)),
      // ),
      home: const Login(),
    );
  }
}
