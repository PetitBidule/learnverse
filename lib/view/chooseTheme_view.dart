import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnverse/view/privacy_view.dart';
import 'package:learnverse/widgets/square_background.dart';

//ignore: must_be_immutable
class Theme1 extends StatefulWidget {
  const Theme1({super.key});

  @override
  State<Theme1> createState() => _Theme1State();
}

class _Theme1State extends State<Theme1> {
  List<String> theme1 = [
    "Food",
    "Manga",
    "Gaming",
    "Movie",
    "Music",
  ];

  List<String> theme2 = [
    "Sport",
    "Anime",
    "Book",
    "Animals",
    "Series",
  ];

  final List<Color> back1 = [
    const Color.fromRGBO(243, 255, 193, 1),
    const Color.fromRGBO(240, 248, 255, 1),
    const Color.fromRGBO(0, 223, 255, 1),
    const Color.fromRGBO(245, 245, 245, 1),
    const Color.fromRGBO(252, 188, 188, 1),
  ];
  final List<Color> back3 = [
    const Color.fromRGBO(243, 255, 193, 0.40),
    const Color.fromRGBO(240, 248, 255, 0.40),
    const Color.fromRGBO(0, 223, 255, 0.40),
    const Color.fromRGBO(245, 245, 245, 0.40),
    const Color.fromRGBO(252, 188, 188, 0.40),
  ];

  final List<Color> back2 = [
    const Color.fromRGBO(255, 255, 255, 1),
    const Color.fromRGBO(140, 178, 114, 1),
    const Color.fromRGBO(248, 231, 222, 1),
    const Color.fromRGBO(255, 235, 202, 1),
    const Color.fromRGBO(237, 215, 19, 1),
  ];

  final List<Image> image1 = [
    Image.asset("asset/image/imageF.png"),
    Image.asset("asset/image/imageMan.png"),
    Image.asset("asset/image/imageG.png"),
    Image.asset("asset/image/imageM.png"),
    Image.asset("asset/image/imageMu.png"),
  ];

  final List<Image> image2 = [
    Image.asset("asset/image/imageT.png"),
    Image.asset("asset/image/imageA.png"),
    Image.asset("asset/image/imageB.png"),
    Image.asset("asset/image/imageL.png"),
    Image.asset("asset/image/imageS.png"),
  ];

  final bool _isSelected = false;
  int _valueSelected = 0;
  final List _colors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
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
              child: Column(
                children: [
                  Image.asset(
                    "asset/image/logoLearnVerse.png",
                    width: 120,
                    height: 120,
                  ),
                  const SizedBox(
                    width: 360,
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text('What do you want to see on LearnVerse?',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 360,
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                          'Select at least 3 interest to personalize your LearnVerse experience.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          )),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 14.0),
                    child: Divider(
                      color: Color.fromARGB(209, 255, 255, 255),
                      endIndent: 40,
                      indent: 40,
                    ),
                  ),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      itemCount: 5,
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
                                      if (_valueSelected < 3) {
                                        if (back1[index] == back3[index]) {
                                          print("nn");
                                        } else {
                                          back1[index] = back3[index];
                                          _valueSelected++;
                                        }
                                      }
                                    });
                                  },
                                  child: Stack(children: [
                                    Positioned(
                                      child: Container(
                                        width: 140,
                                        height: 75,
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
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    // Container(
                                    //   width: 140,
                                    //   height: 75,
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(
                                    //       color: Colors.white,
                                    //     ),
                                    //     color: _valueSelected == index
                                    //         ? back1[index] =
                                    //             const Color.fromARGB(
                                    //                 132, 213, 205, 205)
                                    //         : const Color.fromARGB(
                                    //             1, 255, 255, 255),
                                    //     borderRadius: BorderRadius.circular(20),
                                    //   ),
                                    // ),
                                  ]),
                                ),
                              ),
                              Container(
                                width: 140,
                                height: 75,
                                decoration: BoxDecoration(
                                  color: back2[index],
                                  image: DecorationImage(
                                    image: image2[index].image,
                                  ),
                                  boxShadow: const [],
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
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 85,
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(132, 132, 221, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(132, 132, 221, 1),
                          spreadRadius: 10,
                          blurRadius: 30,
                          offset: Offset(0, -27),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " $_valueSelected of 3 selected",
                            style: const TextStyle(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              _valueSelected == 3
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Privacy()),
                                    )
                                  : null;
                            },
                            child: Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                color: _valueSelected == 3
                                    ? Colors.white
                                    : const Color.fromARGB(139, 255, 255, 255),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        139, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
