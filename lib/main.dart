import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:learnverse/l10n/l10n.dart';
// import 'package:device_preview/device_preview.dart';
import 'package:learnverse/firebase_options.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:learnverse/pubs/admob.dart';
import 'package:learnverse/view/authentification/register/chooseTheme_view.dart';
import 'package:learnverse/view/authentification/register/language.dart';
import 'package:learnverse/view/home/homeTheme_view.dart';
import 'package:learnverse/view/homepage_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// import 'package:localization_i18n_arb/l10n/l10n.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(const Duration(seconds: 2));
  unawaited(MobileAds.instance.initialize());

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

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        // theme: ThemeData(
        //     elevatedButtonTheme:  ElevatedButtonThemeData(
        //         style: ButtonStyle(backgroundColor: MaterialStateProperty<Color> ConstantsColors.iconColors))),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: L10n.all,
        locale: const Locale('fr'),
        debugShowCheckedModeBanner: false,
        home: const AdMob());
  }
}
