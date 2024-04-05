import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learnverse/Model/themechoose_model.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';
import 'package:learnverse/view/settings/privacy_view.dart';
import 'package:learnverse/widgets/square_background.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//ignore: must_be_immutable
class Theme1 extends StatefulWidget {
  const Theme1({super.key});

  @override
  State<Theme1> createState() => _Theme1State();
}

class _Theme1State extends State<Theme1> {
  late List<ThemeChoose> chooseTheme = [
    ThemeChoose(
      theme: AppLocalizations.of(context)!.chooseTheme_item1,
      backgroundColor: const Color.fromRGBO(243, 255, 193, 1),
      backgroundImage: const AssetImage('asset/image/imageF2.png'),
      isDispo: false,
    ),
    ThemeChoose(
      theme: AppLocalizations.of(context)!.chooseTheme_item3,
      backgroundColor: const Color.fromRGBO(240, 248, 255, 1),
      backgroundImage: const AssetImage('asset/image/imageMan.png'),
      isDispo: true,
    ),
    ThemeChoose(
      theme: AppLocalizations.of(context)!.chooseTheme_item5,
      backgroundColor: const Color.fromRGBO(0, 223, 255, 1),
      backgroundImage: const AssetImage('asset/image/imageG2.png'),
      isDispo: true,
    ),
    ThemeChoose(
      theme: AppLocalizations.of(context)!.chooseTheme_item6,
      backgroundColor: const Color.fromRGBO(245, 245, 245, 1),
      backgroundImage: const AssetImage('asset/image/imageM2.png'),
      isDispo: true,
    ),
    ThemeChoose(
      theme: AppLocalizations.of(context)!.chooseTheme_item7,
      backgroundColor: const Color.fromRGBO(252, 188, 188, 1),
      backgroundImage: const AssetImage('asset/image/imageMu.png'),
      isDispo: true,
    )
  ];
  late List<ThemeChoose> chooseTheme2 = [
    ThemeChoose(
      theme: AppLocalizations.of(context)!.chooseTheme_item2,
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      backgroundImage: const AssetImage('asset/image/imageT2.png'),
      isDispo: false,
    ),
    ThemeChoose(
      theme: AppLocalizations.of(context)!.chooseTheme_item4,
      backgroundColor: const Color.fromRGBO(140, 178, 114, 1),
      backgroundImage: const AssetImage('asset/image/imageA2.png'),
      isDispo: true,
    ),
    ThemeChoose(
      theme: 'Book',
      backgroundColor: const Color.fromRGBO(248, 231, 222, 1),
      backgroundImage: const AssetImage('asset/image/imageB2.png'),
      isDispo: false,
    ),
    ThemeChoose(
      theme: AppLocalizations.of(context)!.chooseTheme_item8,
      backgroundColor: const Color.fromRGBO(255, 235, 202, 1),
      backgroundImage: const AssetImage('asset/image/imageL2.png'),
      isDispo: false,
    ),
    ThemeChoose(
      theme: AppLocalizations.of(context)!.chooseTheme_item10,
      backgroundColor: const Color.fromRGBO(237, 215, 19, 1),
      backgroundImage: const AssetImage('asset/image/imageS.png'),
      isDispo: true,
    )
  ];
  final List<Color> back3 = [
    const Color.fromRGBO(243, 255, 193, 0.40),
    const Color.fromRGBO(240, 248, 255, 0.40),
    const Color.fromRGBO(0, 223, 255, 0.40),
    const Color.fromRGBO(245, 245, 245, 0.40),
    const Color.fromRGBO(252, 188, 188, 0.40),
  ];
  int _valueSelected = 0;
  final List<String> _userFavoritesThemes = [];

  Future addUserTheme() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('theo.saint-amand@orange.fr')
        .update({'favorite_theme': _userFavoritesThemes}).then(
            (_) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Privacy()),
                ));
  }

  void _selectedTheme(int x, int y) {
    if (y == 0) {
      if (chooseTheme[x].backgroundColor != back3[x] &&
          chooseTheme[x].isDispo == true) {
        chooseTheme[x].backgroundColor = back3[x];
        _userFavoritesThemes.add(chooseTheme[x].theme);
        _valueSelected++;
      }
    } else {
      if (chooseTheme2[x].backgroundColor != back3[x] &&
          chooseTheme2[x].isDispo == true) {
        chooseTheme2[x].backgroundColor = back3[x];
        _userFavoritesThemes.add(chooseTheme2[x].theme);
        _valueSelected++;
      }
    }
  }

  Widget _themeIsDispo(int x, int y) {
    if (y == 0) {
      if (chooseTheme[x].isDispo == false) {
        return const Icon(
          Icons.lock,
          size: 52,
          color: Color.fromARGB(188, 18, 18, 18),
        );
      }
    } else {
      if (chooseTheme2[x].isDispo == false) {
        return const Icon(
          Icons.lock,
          size: 52,
          color: Color.fromARGB(188, 18, 18, 18),
        );
      }
    }
    return const Icon(
      Icons.face_unlock_rounded,
      size: 0,
    );
  }

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
                children: <Widget>[
                  Image.asset(
                    'asset/image/logoLearnVerse.png',
                    width: 120,
                    height: 120,
                  ),
                  SizedBox(
                    width: 360,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                          AppLocalizations.of(context)!.chooseTheme_title,
                          style: AllConstants.title),
                    ),
                  ),
                  SizedBox(
                    width: 360,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                          AppLocalizations.of(context)!.chooseTheme_subtitle,
                          style: AllConstants.subtitle),
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
                      height: 320,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: chooseTheme.length,
                          itemBuilder: (BuildContext context, int index) => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  2,
                                  (index2) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Stack(children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (_valueSelected < 3) {
                                                  _selectedTheme(index, index2);
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: 140,
                                              height: 80,
                                              decoration: BoxDecoration(
                                                color: index2 == 0
                                                    ? chooseTheme[index]
                                                        .backgroundColor
                                                    : chooseTheme2[index]
                                                        .backgroundColor,
                                                image: DecorationImage(
                                                  image: index2 == 0
                                                      ? chooseTheme[index]
                                                          .backgroundImage
                                                      : chooseTheme2[index]
                                                          .backgroundImage,
                                                ),
                                                border: Border.all(
                                                  color: const Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                    index2 == 0
                                                        ? chooseTheme[index]
                                                            .theme
                                                        : chooseTheme2[index]
                                                            .theme,
                                                    style:
                                                        AllConstants.textBtn),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                              top: 17,
                                              left: 43,
                                              child:
                                                  _themeIsDispo(index, index2)),
                                        ]),
                                      ))))),
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
                            ' $_valueSelected of 3 ${AppLocalizations.of(context)!.chooseTheme_btn}',
                            style: const TextStyle(
                                color: ConstantsColors.iconColors),
                          ),
                          TextButton(
                            onPressed: () {
                              if (_valueSelected == 3) {
                                addUserTheme();
                              }
                            },
                            child: Container(
                              width: 90,
                              height: 30,
                              decoration: BoxDecoration(
                                color: _valueSelected == 3
                                    ? ConstantsColors.iconColors
                                    : const Color.fromARGB(139, 255, 255, 255),
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        139, 255, 255, 255)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Text(
                                  AppLocalizations.of(context)!.chooseTheme_btn,
                                  style: const TextStyle(
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
