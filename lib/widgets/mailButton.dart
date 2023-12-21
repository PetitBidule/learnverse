import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MailButton extends StatefulWidget {
  final String textConnexion;
  final icon;
  const MailButton(
      {super.key, required this.textConnexion, required this.icon});

  @override
  State<MailButton> createState() => _ButtonConnexionState();
}

class _ButtonConnexionState extends State<MailButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          setState(() {}); // routes
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(159, 160, 255, 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FaIcon(
              widget.icon,
              color: Colors.white,
            ),
            SizedBox(width: 50),
            Text(
              widget.textConnexion,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.8),
            ),
          ],
        ));
  }
}
