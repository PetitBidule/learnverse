import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learnverse/dbHelper/mongoDB.dart';
import 'package:learnverse/screen/homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  try {
    print("la connexion est réussi");
    await MongoDB.connect();
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
      debugShowCheckedModeBanner: false,
      home: ScreenLog(),
    );
  }
}
