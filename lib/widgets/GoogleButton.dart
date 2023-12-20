import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleButton extends StatefulWidget {
  final String textConnexion;
  const GoogleButton({super.key, required this.textConnexion});

  @override
  State<GoogleButton> createState() => _ButtonConnexionState();
}

class _ButtonConnexionState extends State<GoogleButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {}); // routes
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FaIcon(FontAwesomeIcons.google),
            SizedBox(width: 50),
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
