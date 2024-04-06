import 'package:flutter/material.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/view/home/hometheme_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//ignore: must_be_immutable
class ButtonConnexion extends StatefulWidget {
  final String textConnexion;
  dynamic pageRoutesConnexion;
  bool isConnexion = false;
  var currentPage;
  ButtonConnexion(
      {super.key,
      required this.textConnexion,
      required this.isConnexion,
      required this.pageRoutesConnexion,
      this.currentPage});

  @override
  State<ButtonConnexion> createState() => _ButtonConnexionState();
}

class _ButtonConnexionState extends State<ButtonConnexion> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      child: TextButton(
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
                      side: const BorderSide(
                          color: ConstantsColors.iconColors)))),
          child: Text(
            widget.textConnexion,
            style: const TextStyle(
                color: ConstantsColors.iconColors,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.8),
          )),
    );
  }
}

class LogInButton extends StatefulWidget {
  final Future signIn;
  final int currentPage;
  const LogInButton(
      {super.key, required this.signIn, required this.currentPage});

  @override
  State<LogInButton> createState() => _LogInButtonState();
}

class _LogInButtonState extends State<LogInButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: ConstantsColors.iconColors,
        ),
        onPressed: () {
          widget.signIn;
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => ThemeScreen(
                      languageUser: 'fr',
                      incrementUser: widget.currentPage,
                    )),
          );
        },
        child: const Text(
          'Log in',
          style: TextStyle(
              color: ConstantsColors.blackColors,
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
          backgroundColor: ConstantsColors.iconColors,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(widget.iconConnexion),
            const SizedBox(width: 50),
            Text(
              widget.textConnexion,
              style: const TextStyle(
                  color: ConstantsColors.blackColors,
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
  final dynamic redirection;
  const MailButton(
      {super.key,
      required this.textConnexion,
      required this.icon,
      this.redirection});

  @override
  State<MailButton> createState() => _MailButtonConnexionState();
}

class _MailButtonConnexionState extends State<MailButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: SizedBox(
        width: 400,
        height: 60,
        child: ElevatedButton(
            onPressed: () {
              widget.redirection;
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ConstantsColors.iconColors,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FaIcon(
                  widget.icon,
                  color: ConstantsColors.blackColors,
                ),
                Text(
                  widget.textConnexion,
                  style: const TextStyle(
                      color: ConstantsColors.blackColors,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.8),
                ),
                const FaIcon(
                  size: 16,
                  FontAwesomeIcons.chevronRight,
                  color: ConstantsColors.blackColors,
                ),
              ],
            )),
      ),
    );
  }
}
