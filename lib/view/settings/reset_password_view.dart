import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  // reset passord function
  Future _resetPasswordUser() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text);
    } on FirebaseAuthException catch (e) {
      print('error $e');
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                'Enter your Email and we will send you a password reset link'),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Enter your email',
                labelStyle: AllConstants.placeholder,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                // hintText: "kiwi",
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
            ),
            TextButton(
                onPressed: () {}, child: const Text('Send reset password'))
          ],
        ),
      ],
    ));
  }
}