import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/view/hometheme_view.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';


class language extends StatefulWidget {
   const language({super.key});

  @override
  State<language> createState() => _languageState();
}

class _languageState extends State<language> {
  final List<Image> image1 = [
    Image.asset("asset/image/france.jpg"),
    Image.asset("asset/image/pizz2.png"),
  ];

    final List<Image> image2 = [
    Image.asset("asset/image/usa.png"),
    Image.asset("asset/image/spain.jpg"),
  ];

  List<String> theme2 = [
    "English",
    "Español",
  ];

  List<String> theme1 = [
    "Français",
    "Italiano",
  ];
  final List<Color> back1 = [
    const Color.fromARGB(255, 255, 255, 255),
    const Color.fromARGB(255, 255, 255, 255),
  ];
   final List<Color> back2 = [
    const Color.fromARGB(255, 255, 255, 255),
    const Color.fromARGB(255, 255, 255, 255),
  ];
   final List<Color> back3 = [
    const Color.fromARGB(123, 255, 255, 255),
    const Color.fromARGB(123, 255, 255, 255),
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
                          Image.asset(
                            "asset/image/logoLearnVerse.png",
                            width: 40,
                            height: 40,
                          ),
                          Padding(
                             padding: const EdgeInsets.only(right:100.0),
                             child: GradientText('Language',
                             style: const TextStyle(
                                       fontSize: 36,
                                       fontWeight: FontWeight.w600,
                                     ),colors: const [
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
                              color: Color.fromARGB(255, 88, 41,145),
                              fontSize: 50,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                     SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                        (back1[index] == back3[index]) ;
                                    }
                                    );
                                  },
                                  child: Stack(children: [
                                    Positioned(
                                      child: Container(
                                        width: 180,
                                        height: 180,
                                        decoration: BoxDecoration(
                                           color: back1[index],
                                          image: DecorationImage(
                                            image: image1[index].image,
                                          ),
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            theme1[index],
                                            style: const TextStyle(
                                              color:
                                                  Color.fromARGB(255, 0, 0, 0),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                              Container(
                                width: 180,
                                height: 180,
                                decoration: BoxDecoration(
                                  color: back2[index],
                                  image: DecorationImage(
                                    image: image2[index].image,
                                  ),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    theme2[index],
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                      },
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
                                    builder: (context) => ThemeScreen(
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
