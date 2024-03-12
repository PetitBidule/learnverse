import 'package:flutter/material.dart';
import 'package:learnverse/view/hometheme_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//ignore: must_be_immutable
class ButtonConnexion extends StatefulWidget {
  final String textConnexion;
  dynamic pageRoutesConnexion;
  bool isConnexion = false;
  ButtonConnexion(
      {super.key,
      required this.textConnexion,
      required this.isConnexion,
      required this.pageRoutesConnexion});

  @override
  State<ButtonConnexion> createState() => _ButtonConnexionState();
}

class _ButtonConnexionState extends State<ButtonConnexion> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => widget.pageRoutesConnexion),
            );
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
  final Future signIn;
  const LogInButton({super.key, required this.signIn});

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
          widget.signIn;
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ThemeScreen(
                      pseudoUser: "rien",
                    )),
          );
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
  final dynamic icon;
  const MailButton(
      {super.key, required this.textConnexion, required this.icon});

  @override
  State<MailButton> createState() => _MailButtonConnexionState();
}

class _MailButtonConnexionState extends State<MailButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 3.0),
      child: SizedBox(
        width: 400,
        height: 60,
        child: ElevatedButton(
            onPressed: () {
              setState(() {}); // routes
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  widget.icon,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                Text(
                  widget.textConnexion,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.8),
                ),
                const FaIcon(
                  FontAwesomeIcons.chevronRight,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ],
            )),
      ),
    );
  }
}
