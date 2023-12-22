import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/widgets/FbButton.dart';
import 'package:learnverse/widgets/GoogleButton.dart';
import 'package:learnverse/widgets/allBouton.dart';
import 'package:learnverse/widgets/squareBackground.dart';

class Login extends StatelessWidget {
  const Login({super.key});

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
              Color.fromRGBO(117, 123, 200, 1),
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 26.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  const Text('Log In  ',
                      style: TextStyle(
                        color: AllConstants.textColors,
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                      )),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 64.0),
              child: Text('log in to your account',
                  style: TextStyle(
                    color: AllConstants.textColors,
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: 250,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.white)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: SizedBox(
                width: 250,
                height: 60,
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.white)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4.0),
              child: Text('forgot your password ?',
                  style: TextStyle(
                    color: AllConstants.textColors,
                    fontSize: 10,
                    fontWeight: FontWeight.w200,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: SizedBox(
                width: 250,
                height: 60,
                child: LogInButton(),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 150.0),
              child: SizedBox(
                  width: 250,
                  height: 60,
                  child: GoogleButton(textConnexion: "google")),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 250,
                height: 60,
                child: FbButton(textConnexion: "facebook"),
              ),
            ),
          ],
        ),
      )),
    ]));
  }
}
