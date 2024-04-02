import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learnverse/view/home/homeTheme_view.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:learnverse/firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

Future getIncrementCategories() async {
  late int incrementn;
  var docSnapshots = await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.email)
      .get();
  if (docSnapshots.exists) {
    Map<String, dynamic>? data = docSnapshots.data();
    var value = data?['currentPage'];
    incrementn = value;
  }
  return incrementn;
}

Future getIncrement() async {
  await FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser?.email)
      .update({
    'currentPage': FieldValue.increment(1),
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();

  try {
    await Firebase.initializeApp(
      name: 'learnverse-ebdd6',
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await MongoDB.connect();
    print('tout est connecte chef');
  } catch (e) {
    print('Erreur:$e');
  }
  int incrementValue = await getIncrementCategories();
  var dateTime = DateTime.now();
  var time1 = DateTime(dateTime.year, dateTime.month, dateTime.day);
  var time2 = DateTime(dateTime.year + 1, dateTime.month, dateTime.day);
  if (time1.compareTo(time2) == -1) {
    getIncrement();
  } else {
    print("les categories n'ont pas changé");
  }
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp(
            caca: incrementValue,
          )));
}

class MyApp extends StatelessWidget {
  final int caca;
  const MyApp({super.key, required this.caca});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      // theme: ThemeData(
      //     elevatedButtonTheme:  ElevatedButtonThemeData(
      //         style: ButtonStyle(backgroundColor: MaterialStateProperty<Color> ConstantsColors.iconColors))),
      debugShowCheckedModeBanner: false,
      home: ThemeScreen(
        incrementUser: caca,
      ),
    );
  }
}
