import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnverse/Model/dbHelper/insert_data.dart';
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:learnverse/controller/account_controller.dart';
import 'package:learnverse/view/hometheme_view.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:crypto/crypto.dart';

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
  String helperText = "";
  final _formKey = GlobalKey<FormState>();
  bool isPassword = true;

  // update
  String encryptPassword(String password) {
    final bytes = utf8.encode(password);
    final hash = sha256.convert(bytes);
    return hash.toString();
  }

  Future<void> insertData(String email, String pseudo, String password) async {
    var id = M.ObjectId();
    final data =
        MongoDbModel(id: id, pseudo: pseudo, email: email, password: password);
    await MongoDB.insert(data);
  }

  // String verificationTextFields() {
  // String helperText = "";
  //   if (_controller[0].text != "" && _controller[1].text != "") {
  //     helperText = "Veuillez rensigner ces champs";
  //     return helperText;
  //   } else {
  //     return "c'est bon les champs ont été renseigner";
  //   }
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
            // update text field
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
                              if (widget.accountController
                                  .verificationPasswordsEmail(
                                      _controller[1].text,
                                      _controller[2].text,
                                      _controller[3].text,
                                      isPassword)) {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  String encryptedPassword =
                                      encryptPassword(_controller[2].text);
                                  print(
                                      'Encrypted password: $encryptedPassword');
                                  insertData(_controller[1].text,
                                      _controller[0].text, encryptedPassword);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ThemeScreen(
                                            createAccount: true,
                                            pseudoUser: _controller[1].text)),
                                  );
                                  print("les données sont envoyées");
                                }
                              } else {
                                isPassword = true;
                                print("les données n'ont pas été envoyés");
                              }
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
