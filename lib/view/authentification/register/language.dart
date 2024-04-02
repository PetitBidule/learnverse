import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';
import 'package:learnverse/view/home/hometheme_view.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class language extends StatelessWidget {
  const language({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
                ],
              ),
            ),
          ),
          const SquareBackground(
            right: 100,
            top: 100,
            backgroundSquare: Color.fromRGBO(142, 148, 242, 1),
          ),
          // ... (Other SquareBackground widgets)
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 50.0, sigmaY: 50.0),
            child: Container(
              color: Colors.black.withOpacity(0.1),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            "asset/image/logoLearnVerse.png",
                            width: 40,
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100.0),
                            child: GradientText(
                              'language',
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w700,
                              ),
                              colors: const [
                                Color.fromARGB(255, 153, 118, 224),
                                Color.fromARGB(255, 153, 107, 156),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      indent: 10,
                      endIndent: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 24.0),
                      child: SizedBox(
                        width: 400,
                        child: Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            'Select language',
                            style: TextStyle(
                              color: Color.fromARGB(255, 88, 41, 145),
                              fontSize: 50,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 400,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 300,
                        height: 60,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(colors: [
                            Color.fromARGB(255, 153, 118, 224),
                            Color.fromARGB(255, 153, 107, 156),
                            // ... (Other gradient colors)
                          ]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ThemeScreen()),
                              );
                            },
                            child: const Text(
                              'Agree',
                              style:
                                  TextStyle(color: ConstantsColors.iconColors),
                            ),
                            // style: ButtonStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
