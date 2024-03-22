import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learnverse/view/authentification/register/chooseTheme_view.dart';
import 'package:learnverse/view/home/homeTheme_view.dart';
import 'package:learnverse/view/homepage_view.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
  try {
    await Firebase.initializeApp();
    await MongoDB.connect();
    print("object");
  } catch (e) {
    print("Erreur:$e");
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(DevicePreview(builder: (contect) => const MyApp())));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      // theme: ThemeData(
      //     elevatedButtonTheme:  ElevatedButtonThemeData(
      //         style: ButtonStyle(backgroundColor: MaterialStateProperty<Color> ConstantsColors.iconColors))),
      debugShowCheckedModeBanner: false,
      home: ScreenLog(),
    );
  }
}
