import 'package:flutter/material.dart';

class ButtonConnexion extends StatefulWidget {
  final String textConnexion;
  const ButtonConnexion({super.key, required this.textConnexion});

  @override
  State<ButtonConnexion> createState() => _ButtonConnexionState();
}

class _ButtonConnexionState extends State<ButtonConnexion> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          setState(() {}); // routes
        },
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 80, vertical: 15)),
            shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255))))),
        child: Text(
          widget.textConnexion,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.8),
        ));
  }
}
