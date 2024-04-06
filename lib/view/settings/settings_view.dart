import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';
import 'package:learnverse/view/settings/reset_password_view.dart';
import 'package:learnverse/widgets/all_bouton.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

Future signOut() async {
  await FirebaseAuth.instance.signOut();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
      SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    image: DecorationImage(
                        image: NetworkImage(
                            '${FirebaseAuth.instance.currentUser?.photoURL}'))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text('${FirebaseAuth.instance.currentUser?.email}',
                  style: const TextStyle(
                    color: ConstantsColors.iconColors,
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  )),
            ),
            SizedBox(
              height: size.height * 0.52,
              child: ListView(
                children: <Widget>[
                  MailButton(
                      redirection: Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (const ResetPasswordScreen()),
                        ),
                      ),
                      textConnexion:
                          AppLocalizations.of(context)!.settings_screen_btn1,
                      icon: FontAwesomeIcons.key),
                  MailButton(
                      textConnexion:
                          AppLocalizations.of(context)!.settings_screen_btn2,
                      icon: FontAwesomeIcons.headset),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: SizedBox(
                      width: 400,
                      height: 60,
                      child: ElevatedButton(
                          onPressed: () {
                            // setState(() async {
                            //   User? user;
                            //   await user?.delete();
                            // });
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
                              const FaIcon(
                                FontAwesomeIcons.arrowRightFromBracket,
                                color: ConstantsColors.blackColors,
                              ),
                              Text(
                                AppLocalizations.of(context)!
                                    .settings_screen_btn3,
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
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    ]));
  }
}
