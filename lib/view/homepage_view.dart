import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnverse/main.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';
import 'package:learnverse/view/authentification/register/language.dart';
import 'package:learnverse/view/authentification/register/register_view.dart';
import 'package:learnverse/view/authentification/login/login_view.dart';
import 'package:learnverse/widgets/all_bouton.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:learnverse/widgets/square_background.dart';

class ScreenLog extends StatefulWidget {
  const ScreenLog({super.key});

  @override
  State<ScreenLog> createState() => _ScreenLogState();
}

class _ScreenLogState extends State<ScreenLog> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.width * 0.10;
    //update this
    return Scaffold(
        body: Stack(children: [
      Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
              Color.fromRGBO(224, 195, 252, 1),
              Color.fromRGBO(203, 178, 254, 1),
              Color.fromRGBO(159, 160, 255, 1),
              AllConstants.backgroundContainer,
            ])),
      ),
      const SquareBackground(
        right: 100,
        top: 100,
        backgroundSquare: Color.fromRGBO(142, 148, 242, 1),
      ),
      const SquareBackground(
        right: 75,
        top: 350,
        backgroundSquare: Color.fromRGBO(117, 123, 233, 1),
      ),
      const SquareBackground(
        left: 50,
        top: 350,
        backgroundSquare: Color.fromRGBO(218, 182, 252, 1),
      ),
      const SquareBackground(
        left: 125,
        bottom: 50,
        backgroundSquare: Color.fromRGBO(203, 178, 254, 1),
      ),
      const SquareBackground(
        right: 100,
        bottom: 250,
        backgroundSquare: Color.fromRGBO(224, 195, 252, 1),
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
        child: Container(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
      SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  setState(() {
                    // Navigator.pushReplacement<void, void>(
                    //     context,
                    //     MaterialPageRoute<void>(
                    //       builder: (BuildContext context) => MyApp(
                    //         language: 'en',
                    //       ),
                    //     ));
                  });
                },
                child: const Text('en')),
            TextButton(
                onPressed: () {
                  setState(() {
                    // Navigator.pushReplacement<void, void>(
                    //     context,
                    //     MaterialPageRoute<void>(
                    //       builder: (BuildContext context) => MyApp(
                    //         language: 'fr',
                    //       ),
                    //     ));
                    // Navigator.pushNamed(context, '/b');
                  });
                },
                child: const Text('fr')),
            Image.asset('asset/image/logoLearnVerse.png'),
            const Text(
              'LearnVerse',
              style: TextStyle(
                  color: ConstantsColors.iconColors,
                  fontSize: 40,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: size,
            ),
            ButtonConnexion(
              textConnexion: AppLocalizations.of(context)!.sign,
              isConnexion: true,
              pageRoutesConnexion: const language(),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonConnexion(
              textConnexion: AppLocalizations.of(context)!.login,
              isConnexion: false,
              pageRoutesConnexion: const Login(),
            ),
          ],
        ),
      )),
    ]));
  }
}
