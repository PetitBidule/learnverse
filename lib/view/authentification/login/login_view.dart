import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/controller/auth_services.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';
import 'package:learnverse/view/authentification/register/chooseTheme_view.dart';
import 'package:learnverse/view/settings/reset_password_view.dart';
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
  int incrementn = 0;

  final List<String> _labelText = [
    'Email',
    'Password',
  ];
  final List<bool> _obscureText = [
    false,
    true,
  ];

  Future getIncrement() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('theo.saint-amand@orange.fr')
        .update({
      'currentPage': FieldValue.increment(1),
    });
  }

  // Future getIncrementCategories() async {
  //   var docSnapshots = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc('theo.saint-amand@orange.fr')
  //       .get();
  //   if (docSnapshots.exists) {
  //     Map<String, dynamic>? data = docSnapshots.data();
  //     var value = data?['currentPage'];
  //     incrementn = value;
  //     return incrementn;
  //   }
  // }

  void incrementCurrrentPage() async {
    var dateTime = DateTime.now();
    var time1 = DateTime(dateTime.year, dateTime.month, dateTime.day);
    var time2 = DateTime(dateTime.year + 1, dateTime.month, dateTime.day);
    if (time1.compareTo(time2) == -1) {
      getIncrement();
    } else {
      print("les categories n'ont pas changé");
    }
  }

  IconData _iconData = FontAwesomeIcons.eyeSlash;
  Future addUserDetailsGoogle() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser?.email)
        .set({
      'pseudo': FirebaseAuth.instance.currentUser?.displayName,
      'dateTime': DateTime.now(),
      'imageProfile': FirebaseAuth.instance.currentUser?.photoURL,
      'watchlist': [],
    });
  }

  void testFunction() async {
    int incrementValue = await AuthService().getIncrementCategories(incrementn);
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
        resizeToAvoidBottomInset: false,
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
                  child: Text('log in to your account',
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
                          2,
                          (int index) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                suffixIcon: _labelText[index] == 'Password'
                                    ? Padding(
                                        padding:
                                            const EdgeInsets.only(top: 12.0),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              if (_obscureText[1] == true) {
                                                _obscureText[1] = false;
                                                _iconData =
                                                    FontAwesomeIcons.eye;
                                              } else {
                                                _obscureText[1] = true;
                                                _iconData =
                                                    FontAwesomeIcons.eyeSlash;
                                              }
                                            });
                                          },
                                          child: FaIcon(
                                            _iconData,
                                            color: ConstantsColors.iconColors,
                                          ),
                                        ),
                                      )
                                    : null,
                                labelText: _labelText[index],
                                labelStyle: AllConstants.placeholder,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: const BorderSide(
                                      color:
                                          Color.fromARGB(255, 255, 255, 255)),
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
                  padding: const EdgeInsets.only(right: 30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ResetPasswordScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF0000ee),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: SizedBox(
                    width: 250,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ConstantsColors.iconColors,
                        ),
                        onPressed: () async {
                          AuthService()
                              .signIn(_controller[0].text.trim(),
                                  _controller[1].text.trim())
                              // .then((_) => incrementCurrrentPage())
                              // .then((_) => AuthService()
                              //     .getIncrementCategories(incrementn))
                              // .then((_) => testFunction())
                              .then((_) => Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Theme1()),
                                  ));
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                              color: ConstantsColors.blackColors,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.8),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () async {
                          // User? user;
                          try {
                            print('1');
                            await AuthService().signInWithGoogle();
                            print('2');

                            // incrementCurrrentPage();
                            // addUserDetailsGoogle();
                            // Navigator.pushNamed(context, '/hompage');
                          } catch (e) {
                            print('object');
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ConstantsColors.iconColors,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset('asset/image/google.png'),
                            const SizedBox(width: 50),
                            const Text(
                              'Google',
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
