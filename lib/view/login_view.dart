import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnverse/controller/app_configuration.dart';
import 'package:learnverse/controller/services.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/view/homeTheme_view.dart';
import 'package:learnverse/widgets/all_bouton.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:realm/realm.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
  List<String> scopes = <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];
//   Future<User> logIn(Credentials credentials) async {
//   var userHandle = await realmCore.logIn(this, credentials);
//   return UserInternal.create(userHandle, this);
// }
  final app = App(AppConfiguration('learneverse-ydjls'));

  // final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  // Future<GoogleSignInAuthentication> _handleSignIn() async {
  //   await _googleSignIn.signIn();
  //   // Une fois connecté avec succès, vous pouvez obtenir le code d'accès.
  //   String authCode = await _googleSignIn.currentUser!.authentication.idToken;

  //   // Utilisez maintenant authCode pour vous connecter à MongoDB Realm.
  //   final googleAuthCodeCredentials = Credentials.googleAuthCode(authCode);
  //   final currentUser = await app.logIn(googleAuthCodeCredentials);

  //   // ... Faites quelque chose avec l'utilisateur connecté.
  // }

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
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  const Text('Log In  ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w300,
                      )),
                  const SizedBox(
                    width: 20,
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 64.0),
              child: Text('log in to your account',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  )),
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
                            labelText: _labelText[index],
                            labelStyle: const TextStyle(color: Colors.white),
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
                          obscureText: false,
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
            const Padding(
              padding: EdgeInsets.only(top: 32.0),
              child: SizedBox(
                width: 250,
                height: 60,
                child: LogInButton(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: SizedBox(
                width: 250,
                height: 60,
                child: ElevatedButton(
                    onPressed: () {
                      // final googleAuthCodeCredentials =
                      //     Credentials.googleAuthCode(authCode);
                      // final currentUser =
                      //     await app.logIn(googleAuthCodeCredentials);
                      // Connexion à MongoDB Realm
                      // Une fois connecté avec succès, vous pouvez obtenir le code d'accès.

                      // final googleAuthCodeCredentials =
                      //     Credentials.googleAuthCode();
                      // final currentUser =
                      //     await app.logIn(googleAuthCodeCredentials);
                      // final emailPwCredentials = Credentials.emailPassword(
                      //     _controller[0].text, _controller[1].text);
                      // await app.logIn(emailPwCredentials);

                      // final emailPwCredentials = Credentials.emailPassword(
                      //     _controller[0].text, _controller[1].text);
                      // await app.logIn(emailPwCredentials);
                      // final user1 = app.currentUser!;
                      // final updatedTimestamp =
                      //     DateTime.now().millisecondsSinceEpoch;
                      // final updatedCustomUserData = {
                      //   "userId": user1.id,
                      //   "favoriteFood": "pizza",
                      //   "lastUpdated": updatedTimestamp
                      // };

                      // final functionResponse = await user1.functions
                      //     .call("writeCustomUserData", [updatedCustomUserData]);
                      // final customUserData = await user1.refreshCustomData();
                      // final user = app.currentUser!;
                      // final updatedCustomUserData = {
                      //   "userId": user.id,
                      //   "favoriteFood": "pizza",
                      // };

                      // final functionResponse = await user.functions
                      //     .call("writeCustomUserData", [updatedCustomUserData]);

                      // final customUserData = await user.refreshCustomData();

                      // final user = await app.logIn(Credentials.emailPassword(
                      //     _controller[0].text, _controller[1].text));
                      UserFunctions.loginUser(
                          _controller[0].text, _controller[1].text);
                      UserFunctions.insertData();

                      // final customUserData = user.customData;
                      // final updatedCustomData = await user.refreshCustomData();
                      print("object");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThemeScreen(
                                  firstConnexion: false,
                                  pseudoUser: "rien",
                                )),
                      );
                    },

                    // AuthService().signInWithGoogle(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("asset/image/google.png"),
                        const SizedBox(width: 50),
                        const Text(
                          "Google",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.8),
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
