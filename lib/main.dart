import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:learnverse/firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:learnverse/l10n/l10n.dart';
import 'package:learnverse/view/authentification/register/register_view.dart';
import 'package:learnverse/view/homepage_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 2));
  // unawaited(MobileAds.instance.initialize());

  FlutterNativeSplash.remove();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ).then((value) => print("bonjour c'est firebase"));
    await MongoDB.connect();
    print('tout est connecte chef');
  } catch (e) {
    print('Erreur:$e');
  }

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(MyApp(
            languages: 'en',
            isLanguage: false,
          )));
}

class MyApp extends StatelessWidget {
  String languages;
  bool isLanguage = false;
  MyApp({super.key, required this.languages, required this.isLanguage});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Locale(languages),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      debugShowCheckedModeBanner: false,
      home: isLanguage == false ? const ScreenLog() : const Account(),
    );
  }
}
