import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/widgets/FbButton.dart';
import 'package:learnverse/widgets/GoogleButton.dart';
import 'package:learnverse/widgets/allBouton.dart';
import 'package:learnverse/widgets/squareBackground.dart';

import 'package:flutter/material.dart';

class Theme1 extends StatelessWidget {
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
    "Manhwa",
  ];
final List<Color>back1 = [
    Color.fromRGBO(243, 255, 193, 1),
    Color.fromRGBO(240, 248, 255, 1),
    Color.fromRGBO(0, 223, 255, 1),
    Color.fromRGBO(245, 245, 245, 1),
    Color.fromRGBO(245, 245, 245, 1),

  ];
  final List<Color>back2 = [
    Color.fromRGBO(255, 255, 255, 1),
    Color.fromRGBO(140, 178, 114, 1),
    Color.fromRGBO(248, 231, 222, 1),
    Color.fromRGBO(255, 235, 202, 1),
    Color.fromRGBO(255, 235, 202, 1),

  ];
  final List<Image>image1 = [
    Image.asset("asset/image/imageF.png"),
    Image.asset("asset/image/image3.png"),
    Image.asset("asset/image/imageG.png"),
    Image.asset("asset/image/imageM.png"),
    Image.asset("asset/image/imageM.png"),
  ];
  final List<Image>image2 = [
    Image.asset("asset/image/imageT.png"),
    Image.asset("asset/image/imageA.png"),
    Image.asset("asset/image/imageB.png"),
    Image.asset("asset/image/imageL.png"),
    Image.asset("asset/image/imageL.png"),
  ];

  Theme1({super.key});
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
        child: Column(
          children: [
            Image.asset("asset/image/learne.png"),
            SizedBox(
              width: 400,
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text('What do you want to see on LearnVerse?',
                    style: TextStyle(
                      color: AllConstants.textColors,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    )),
              ),
            ),
             SizedBox(
              width: 400,
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text('Select at least 3 interest to personalize your LearnVerse experience.',
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
                                    color:
                                        const Color.fromARGB(255, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(40),
                              ),
                            ),
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
                           padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child:  
                       Container(
                          width: 140,
                          height: 75,
                          decoration: BoxDecoration(
                            color: back1[index],
                            image: DecorationImage(
                              image: image1[index].image,
                            ),
                            boxShadow: const [],
                            border: Border.all(
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              theme1[index],
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w900,
                                fontSize: 14,
                              ),
                            ),
                          ),
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
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              theme2[index],
                              style: TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w900,
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
              width: 500,
              height: 110,
              decoration: BoxDecoration(
                  boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(1132, 132, 221,0.5  ),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(4, 1),
            ),
          ],
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "0 of 3 selected",
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 162.0),
                    child: Container(
                      width: 90,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              borderRadius: BorderRadius.circular(20),),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700

                                  ),
                                ),
                              ),
                      ),
          
                    ),
                  
                ],
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
