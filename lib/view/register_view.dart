import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnverse/controller/account_controller.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/view/homeTheme_view.dart';
import 'package:learnverse/view/verify_email.dart';
import 'package:learnverse/widgets/square_background.dart';

class Account extends StatefulWidget {
  final CreateAccountController accountController;
  const Account({super.key, required this.accountController});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final List<TextEditingController> _controller =
      List.generate(4, (int index) => TextEditingController());
  final List<String> _labelText = [
    "Pseudo",
    "Email",
    "Password",
    "Confirm Password",
  ];
  final List<bool> _obscureText = [false, false, true, true];
  final _formKey = GlobalKey<FormState>();
  bool isPassword = true;

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
      print("les données ont été envoyés ");
      addUserDetails();
    } on FirebaseAuthException catch (e) {
      print("error ${e.message}");
      return e.message;
    }
  }

  Future addUserDetails() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.email)
        .set({
      "pseudo": _controller[0].text,
      "userId": FirebaseAuth.instance.currentUser?.uid,
      "watchlist": [],
    }).then((_) => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => ThemeScreen())));
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
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 26.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  const Text('Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                      )),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 48.0),
              child: Text('Create your account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  )),
            ),
            SizedBox(
              width: 350,
              child: Form(
                // autovalidateMode:
                //     AutovalidateMode.always, // a voir si on met ou pas
                key: _formKey,
                child: Column(
                  children: [
                    Wrap(
                        children: List<Widget>.generate(
                      4,
                      (int index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: _labelText[index] == "Password"
                                ? const Tooltip(
                                    message:
                                        "Le mot de passe doit contenit minimum 8 caracteres",
                                    child: Icon(
                                      Icons.info,
                                      color: Colors.white,
                                    ),
                                  )
                                : null,
                            labelText: _labelText[index],
                            labelStyle: const TextStyle(color: Colors.white),
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
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
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
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                if (widget.accountController
                                    .verificationPasswordsEmail(
                                        _controller[1].text,
                                        _controller[2].text,
                                        _controller[3].text,
                                        isPassword)) {
                                  signUp();
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const VerifyEmailPassword()),
                                  // );
                                } else {
                                  isPassword = true;
                                  print("les données n'ont pas été envoyés");
                                }
                              });
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.8),
                            )),
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
