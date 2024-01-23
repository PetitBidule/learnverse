import 'package:flutter/material.dart';
import 'package:learnverse/screen/createaccount.dart';
import 'package:learnverse/screen/homeTheme.dart';
import 'package:learnverse/screen/login.dart';
import 'package:learnverse/utils/constants.dart';

class ButtonConnexion extends StatefulWidget {
  final String textConnexion;
  bool isConnexion = false;
  ButtonConnexion(
      {super.key, required this.textConnexion, required this.isConnexion});

  @override
  State<ButtonConnexion> createState() => _ButtonConnexionState();
}

class _ButtonConnexionState extends State<ButtonConnexion> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            if (widget.isConnexion == false) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Account()),
              );
            }
          }); // routes
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    side: const BorderSide(color: AllConstants.textColors)))),
        child: Text(
          widget.textConnexion,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.8),
        ));
  }
}

class LogInButton extends StatefulWidget {
  const LogInButton({super.key});

  @override
  State<LogInButton> createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ThemeScreen()),
            );
          });
        },
        child: const Text(
          "Log in",
          style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.8),
        ));
  }
}
