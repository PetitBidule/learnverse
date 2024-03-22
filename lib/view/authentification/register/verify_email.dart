import 'dart:async';
import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/view/authentification/register/chooseTheme_view.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class VerifyEmailPassword extends StatefulWidget {
  const VerifyEmailPassword({super.key});

  @override
  State<VerifyEmailPassword> createState() => _VerifyEmailPasswordState();
}

class _VerifyEmailPasswordState extends State<VerifyEmailPassword> {
  final user = FirebaseAuth.instance.currentUser!;
  late Timer _timer;
  bool isEmailVerified = false;
  @override
  void initState() {
    super.initState();
    isEmailVerified = user.emailVerified;
    if (!isEmailVerified) {
      final user = FirebaseAuth.instance.currentUser!;
      user.sendEmailVerification();
      _timer = Timer.periodic(const Duration(seconds: 3), (_) {
        checkEmailVerification();
      });
    }
  }

  Future checkEmailVerification() async {
    await FirebaseAuth.instance.currentUser!.reload();

    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const Theme1();
      }));
      _timer.cancel();
    }
  }

  void _sendEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'theo.saint-amand@orange.fr',
      query: "subject=News&body=New%20plugin",
    );
    launchUrl(emailLaunchUri);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Check your inbox',
                  style: TextStyle(
                      color: ConstantsColors.iconColors,
                      fontSize: 24,
                      fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 90.0, vertical: 20),
                  child: Text(
                      "To confirm your email, tap on the link we sent to ${user.email}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: ConstantsColors.iconColors,
                        fontSize: 18,
                      )),
                ),
                Lottie.network(
                  "https://lottie.host/ce9d0c96-22e6-47a0-b633-17b130a2613c/pkTuAEqKly.json",
                  width: 200,
                ),
                TextButton(
                    onPressed: () {
                      _sendEmail();
                    },
                    child: const Text('Open Email App'))
              ],
            ),
          )
        ],
      ),
    );
  }
}
