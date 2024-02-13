import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/widgets/squareBackground.dart';

class Theme1 extends StatelessWidget {
  const Theme1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
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
              Color.fromRGBO(117, 123, 200, 1),
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
          child: Column(children: [
            // Image.asset("asset/image/learne.png"),
            const SizedBox(
              width: 400,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text('What do you want to see on LearnVerse?',
                    style: TextStyle(
                      color: AllConstants.textColors,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ),
            const SizedBox(
              width: 400,
              child: Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                    'Select at least 3 interest to personalize your LearnVerse experience.',
                    style: TextStyle(
                      color: AllConstants.textColors,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(36.0),
              child: Container(
                child: Container(
                  width: 350,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [],
                    border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 500,
              child: ListView.builder(
                  itemCount: 7,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            width: 200,
                            height: 100,
                            color: Colors.red,
                            child: const Center(child: Text("Hello")),
                          ),
                        ),
                        Container(
                          width: 200,
                          height: 100,
                          color: Colors.red,
                          child: const Center(child: Text("Hello")),
                        ),
                      ],
                    );
                  }),
            )
          ]),
        ),
      )
    ]));
  }
}
