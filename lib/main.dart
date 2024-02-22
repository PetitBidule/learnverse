import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:learnverse/controller/account_controller.dart';
import 'package:learnverse/view/chooseTheme_view.dart';
import 'package:learnverse/view/createaccount_view.dart';
import 'package:learnverse/view/homepage_view.dart';
import 'package:learnverse/view/login_view.dart';
import 'package:learnverse/view/privacy_view.dart';

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
    return  MaterialApp(
      // theme: ThemeData(
      //     elevatedButtonTheme:  ElevatedButtonThemeData(
      //         style: ButtonStyle(backgroundColor: MaterialStateProperty<Color> Colors.white))),
      debugShowCheckedModeBanner: false,
      home: privacy(),
    );
  }
}
