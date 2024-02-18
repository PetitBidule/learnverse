import 'package:flutter/material.dart';
import 'package:learnverse/view/hometheme_view.dart';
import 'package:learnverse/view/login_view.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//ignore: must_be_immutable
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
                MaterialPageRoute(builder: (context) => Login()),
              );
            } else {}
          }); // routes
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    side: const BorderSide(color: Colors.white)))),
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
          // if () {

          // } else {

          // }
          setState(() => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThemeScreen()),
              ));
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

// btn google and facebook
class OtherBtnConnexion extends StatefulWidget {
  final String textConnexion;
  final dynamic iconConnexion;
  const OtherBtnConnexion(
      {super.key, required this.textConnexion, required this.iconConnexion});

  @override
  State<OtherBtnConnexion> createState() => _OtherButtonConnexionState();
}

class _OtherButtonConnexionState extends State<OtherBtnConnexion> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => setState(() {}) // routes
        ,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(widget.iconConnexion),
            const SizedBox(width: 50),
            Text(
              widget.textConnexion,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8),
            ),
          ],
        ));
  }
}

class MailButton extends StatefulWidget {
  final String textConnexion;
  final icon;
  const MailButton(
      {super.key, required this.textConnexion, required this.icon});

  @override
  State<MailButton> createState() => _MailButtonConnexionState();
}

class _MailButtonConnexionState extends State<MailButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: 350,
        height: 60,
        child: ElevatedButton(
            onPressed: () {
              setState(() {}); // routes
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(159, 160, 255, 1),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FaIcon(
                  widget.icon,
                  color: Colors.white,
                ),
                const SizedBox(width: 50),
                Text(
                  widget.textConnexion,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.8),
                ),
              ],
            )),
      ),
    );
  }
}
