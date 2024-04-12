import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/main.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';
import 'package:learnverse/view/authentification/register/register_view.dart';
import 'package:learnverse/view/homepage_view.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class language extends StatefulWidget {
  const language({super.key});

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  final List<String> languageChooseBackground = [
    'asset/image/france.jpg',
    'asset/image/german_language.jpeg',
    'asset/image/usa.png',
    'asset/image/spain.jpg',
  ];
  List<String> languageChoose = [
    'Français',
    'Allemand',
    'English',
    'Español',
  ];
  String language = 'en';
  int? test = 1;
  final List<Color> _borderColor = [
    const Color.fromARGB(255, 255, 255, 255),
    const Color.fromARGB(255, 255, 255, 255),
    const Color.fromARGB(255, 255, 255, 255),
    const Color.fromARGB(255, 255, 255, 255),
  ];

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
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: ConstantsColors.iconColors),
                                borderRadius: BorderRadius.circular(50)),
                            child: IconButton(
                                onPressed: () => setState(() {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ScreenLog()),
                                      );
                                    }),
                                icon: const FaIcon(
                                  FontAwesomeIcons.chevronLeft,
                                  size: 18,
                                  color: ConstantsColors.iconColors,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 100.0),
                            child: GradientText(
                              'Language',
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.w600,
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
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Select language',
                            style: TextStyle(
                              color: Color.fromARGB(255, 88, 41, 145),
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        height: 425,
                        child: GridView.count(
                          crossAxisCount: 2,
                          children: List.generate(4, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (index == 0) {
                                      language = 'fr';

                                      _borderColor[index] =
                                          const Color.fromARGB(
                                              255, 88, 41, 145);
                                    } else if (index == 1) {
                                      language = 'de';
                                      _borderColor[index] =
                                          const Color.fromARGB(
                                              255, 88, 41, 145);
                                    } else if (index == 2) {
                                      language = 'en';
                                      _borderColor[index] =
                                          const Color.fromARGB(
                                              255, 88, 41, 145);
                                    } else {
                                      language = 'es';
                                      _borderColor[index] =
                                          const Color.fromARGB(
                                              255, 88, 41, 145);
                                    }
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            languageChooseBackground[index]),
                                        fit: BoxFit.contain,
                                      ),
                                      border: Border.all(
                                          color: _borderColor[index])),
                                  child: Center(
                                      child: Text(
                                    languageChoose[index],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 24),
                                  )),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
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
                          ]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: TextButton(
                            onPressed: () async {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Account()),
                              );
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyApp(
                                          isLanguage: true,
                                          languages: language,
                                        )),
                              );
                            },
                            child: const Text(
                              'Save language',
                              style: TextStyle(color: Colors.white),
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
