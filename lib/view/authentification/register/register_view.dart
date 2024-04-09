import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';
import 'package:learnverse/view/authentification/register/language.dart';
import 'package:learnverse/view/authentification/register/verify_email.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Account extends StatefulWidget {
  const Account({
    super.key,
  });

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final List<TextEditingController> _controller =
      List.generate(4, (int index) => TextEditingController());
  late final List<String> _labelText = [
    AppLocalizations.of(context)!.registe_screen_placeholder_pseudo,
    AppLocalizations.of(context)!.registe_screen_placeholder_email,
    AppLocalizations.of(context)!.registe_screen_placeholder_password,
    AppLocalizations.of(context)!.registe_screen_placeholder_cpassword,
  ];
  final List<bool> _obscureText = [false, false, true, true];
  final _formKey = GlobalKey<FormState>();
  bool isPassword = true;
  void showDialogBox(String validate) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(validate),
          );
        });
  }

  @override
  void dispose() {
    _controller[0].dispose();
    _controller[1].dispose();
    _controller[2].dispose();
    _controller[3].dispose();
    super.dispose();
  }

  Future signUp() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _controller[1].text, password: _controller[2].text)
          .then((_) => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => const VerifyEmailPassword())));
      addUserDetails();
    } on FirebaseAuthException catch (e) {
      showDialogBox('$e');
      return e.message;
    }
  }

  Future addUserDetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.email)
        .set({
      'pseudo': _controller[0].text,
      'userId': FirebaseAuth.instance.currentUser?.uid,
      'currentPage': 0,
      'imageUrl':
          'data:image/png;base64,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',
      'watchlist': [],
    });
  }

  String? verificationEmail(String? email) {
    bool emailIsValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch('$email');
    if (emailIsValid == true) {
      return null;
    } else {
      return AppLocalizations.of(context)!.registe_screen_error;
    }
  }

  String? verificationPasswords(String? password) {
    if (password != null && password.length >= 8) {
      return null;
    } else {
      return AppLocalizations.of(context)!.registe_screen_error1;
    }
  }

  String? verificationCPasswords(String? password, String cpassword) {
    if (password == cpassword) {
      return null;
    } else {
      return AppLocalizations.of(context)!.registe_screen_error2;
    }
  }

  @override
  Widget build(BuildContext context) {
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
            Padding(
              padding: const EdgeInsets.only(bottom: 26.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const language()));
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ConstantsColors.iconColors,
                      size: 35,
                    ),
                  ),
                  Text(AppLocalizations.of(context)!.registe_screen_title,
                      style: AllConstants.title),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 48.0),
              child: Text(AppLocalizations.of(context)!.registe_screen_subtitle,
                  style: AllConstants.subtitle),
            ),
            SizedBox(
              width: 350,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Wrap(
                        children: List<Widget>.generate(
                      4,
                      (int index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          validator: index == 1
                              ? (value) => verificationEmail(value)
                              : index == 2
                                  ? (value) => verificationPasswords(value)
                                  : index == 3
                                      ? (value) => verificationCPasswords(
                                          value, _controller[2].text)
                                      : null,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            suffixIcon: _labelText[index] ==
                                    AppLocalizations.of(context)!
                                        .registe_screen_placeholder_password
                                ? Tooltip(
                                    message: AppLocalizations.of(context)!
                                        .registe_screen_tooltips,
                                    child: const Icon(
                                      Icons.info,
                                      color: ConstantsColors.iconColors,
                                    ),
                                  )
                                : null,
                            labelText: _labelText[index],
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
                          obscureText: _obscureText[index],
                          controller: _controller[index],
                        ),
                      ),
                    )),
                    Padding(
                      padding: const EdgeInsets.only(top: 80.0),
                      child: SizedBox(
                        width: 250,
                        height: 60,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ConstantsColors.iconColors,
                            ),
                            onPressed: () {
                              setState(() {
                                signUp();
                              });
                            },
                            child: Text(
                                AppLocalizations.of(context)!
                                    .registe_screen_btn,
                                style: AllConstants.textBtn)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    ]));
  }
}
