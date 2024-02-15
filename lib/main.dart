import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:learnverse/controller/account_controller.dart';
import 'package:learnverse/view/homepage_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  try {
    await MongoDB.connect();
  } catch (e) {
    print("Erreur:$e");
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CreateAccountController controller = CreateAccountController();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenLog(),
    );
  }
}
