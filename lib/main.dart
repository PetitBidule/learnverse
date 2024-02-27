import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:learnverse/view/chooseTheme_view.dart';
import 'package:learnverse/view/homepage_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learnverse/view/privacy_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  try {
    await MongoDB.connect();
    print("object");
  } catch (e) {
    print("Erreur:$e");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // theme: ThemeData(
      //     elevatedButtonTheme:  ElevatedButtonThemeData(
      //         style: ButtonStyle(backgroundColor: MaterialStateProperty<Color> Colors.white))),
      debugShowCheckedModeBanner: false,
      home: Privacy(),
    );
  }
}
