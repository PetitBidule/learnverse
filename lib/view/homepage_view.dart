import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnverse/controller/account_controller.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/view/register_view.dart';
import 'package:learnverse/view/login_view.dart';
import 'package:learnverse/widgets/all_bouton.dart';
import 'package:learnverse/widgets/square_background.dart';

class ScreenLog extends StatelessWidget {
  final CreateAccountController controller = CreateAccountController();
  ScreenLog({super.key});

  @override
  Widget build(BuildContext context) {
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
            Image.asset("asset/image/logoLearnVerse.png"),
            const Text(
              'LearnVerse',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonConnexion(
              textConnexion: "Sign Up",
              isConnexion: true,
              pageRoutesConnexion: Account(
                accountController: controller,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonConnexion(
              textConnexion: "Log In  ",
              isConnexion: false,
              pageRoutesConnexion: const Login(),
            ),
          ],
        ),
      )),
    ]));
  }
}
