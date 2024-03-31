import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/controller/auth_services.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';
import 'package:learnverse/view/home/homeTheme_view.dart';
import 'package:learnverse/widgets/all_bouton.dart';
import 'package:learnverse/widgets/square_background.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final List<TextEditingController> _controller =
      List.generate(2, (int index) => TextEditingController());

  final _formKey = GlobalKey<FormState>();

  final List<String> _labelText = [
    "Email",
    "Password",
  ];
  final List<bool> _obscureText = [
    false,
    true,
  ];
  IconData _iconData = FontAwesomeIcons.eyeSlash;
  Future signIn() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _controller[0].text, password: _controller[1].text)
          .then((_) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => ThemeScreen(
                          pseudoUser: "rien",
                        )),
              ));
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  final DateTime _dateTime = DateTime.now();
// String formatHour = DateFormat.Hm().format(_dateTime);
  Future addUserDetailsGoogle() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.email)
        .set({
      "pseudo": FirebaseAuth.instance.currentUser?.displayName,
      "currentPage": 0,
      "dateTime": DateTime.now(),
      "imageProfile": FirebaseAuth.instance.currentUser?.photoURL,
      "watchlist": [],
    }).then((_) => Navigator.pushReplacement<void, void>(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => ThemeScreen(),
            )));
  }

  @override
  void dispose() {
    _controller[0].dispose();
    _controller[1].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: ConstantsColors.iconColors,
                      size: 35,
                    ),
                  ),
                  const Text('Log In  ', style: AllConstants.title),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 64.0),
              child:
                  Text('log in to your account', style: AllConstants.subtitle),
            ),
            SizedBox(
              width: 350,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Wrap(
                        children: List<Widget>.generate(
                      2,
                      (int index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: _labelText[index] == "Password"
                                ? Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          if (_obscureText[1] == true) {
                                            _obscureText[1] = false;
                                            _iconData = FontAwesomeIcons.eye;
                                          } else {
                                            _obscureText[1] = true;
                                            _iconData =
                                                FontAwesomeIcons.eyeSlash;
                                          }
                                        });
                                      },
                                      child: Tooltip(
                                        message:
                                            "Le mot de passe doit contenit minimum 8 caracteres",
                                        child: FaIcon(
                                          _iconData,
                                          color: ConstantsColors.iconColors,
                                        ),
                                      ),
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
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: SizedBox(
                width: 250,
                height: 60,
                child: LogInButton(
                  signIn: signIn(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                height: 60,
                child: ElevatedButton(
                    onPressed: () async {
                      User? user;
                      user = await AuthService().signInWithGoogle();
                      addUserDetailsGoogle();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ConstantsColors.iconColors,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("asset/image/google.png"),
                        const SizedBox(width: 50),
                        const Text(
                          "Google",
                          style: AllConstants.textBtn,
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      )),
    ]));
  }
}
