import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnverse/view/homeTheme_view.dart';
import 'package:learnverse/view/login_view.dart';

class CreateAccountController {
  bool verificationPasswordsEmail(
      String email, String password, String cpassword, bool ispwd) {
    bool emailIsValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (password == cpassword) {
      if (emailIsValid == true) {
        ispwd = true;
        return ispwd;
      } else {
        return false;
      }
    } else {
      ispwd = false;
      return ispwd;
    }
  }
}

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
              return ThemeScreen(
                firstConnexion: false,
              );
            } else {
              print("vous ne pouver pas vous connecter");
              return const Login();
            }
          }),
    );
  }
}
