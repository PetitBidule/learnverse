import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/view/home/homeTheme_view.dart';
import 'package:learnverse/view/authentification/login/login_view.dart';

class CreateAccountController {}

class LogInController extends StatelessWidget {
  const LogInController({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print("vous pouver vous connecter");
              return ThemeScreen();
            } else {
              print("vous ne pouver pas vous connecter");
              return const Login();
            }
          }),
    );
  }
}
