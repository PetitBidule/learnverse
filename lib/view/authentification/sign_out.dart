import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:learnverse/view/homepage_view.dart';

class LogOutScreen extends StatefulWidget {
  const LogOutScreen({super.key});

  @override
  State<LogOutScreen> createState() => _LogOutScreenState();
}

class _LogOutScreenState extends State<LogOutScreen> {
  dynamic signOut() {
    FirebaseAuth.instance.signOut().then((_) => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ScreenLog()),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: TextButton(
          onPressed: () {
            signOut();
          },
          child: const Text('Disconnect')),
    ));
  }
}
