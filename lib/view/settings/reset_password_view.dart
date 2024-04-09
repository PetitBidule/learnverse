import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';
import 'package:learnverse/widgets/square_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void showDialogBox(String validate) {
    _emailController.clear();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(validate),
          );
        });
  }

  Future _resetPasswordUser() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text)
          .then((value) => showDialogBox(
              'Un email vous a été envoyé pour réinitialer votre mot de passe'));
    } on FirebaseAuthException catch (e) {
      showDialogBox('Error: $e');
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
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
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: ConstantsColors.iconColors),
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                  onPressed: () => setState(() {
                        Navigator.pop(context);
                      }),
                  icon: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    size: 18,
                    color: ConstantsColors.iconColors,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                        'Enter your Email and we will send you a password reset link'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Enter your email',
                        labelStyle: AllConstants.placeholder,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 250,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ConstantsColors.iconColors,
                        ),
                        onPressed: _resetPasswordUser,
                        child: const Text('Send reset password',
                            style: AllConstants.textBtn)),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
