import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';

class ThemeChooseHome extends StatelessWidget {
  final String noteTheme;
  final String nametheme;
  final String nameCategories;
  final String backGroundTheme;

  const ThemeChooseHome({
    super.key,
    required this.noteTheme,
    required this.nametheme,
    required this.nameCategories,
    required this.backGroundTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: 200,
      height: 400,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(1, 4), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(44),
          image: DecorationImage(
              image: nametheme == "Napoleon"
                  ? NetworkImage(
                      "https://image.tmdb.org/t/p/w500/$backGroundTheme")
                  : NetworkImage(backGroundTheme),
              fit: BoxFit.cover)),
      child: Stack(children: [
        Positioned(
          top: 20,
          left: 20,
          child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: ConstantsColors.iconColors),
                  color: ConstantsColors.blackColors,
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  noteTheme,
                  style: AllConstants.text,
                ),
              )),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: 261,
            height: 305,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                      ConstantsColors.blackColors,
                      Color.fromARGB(0, 0, 0, 0)
                    ]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(44),
                    bottomRight: Radius.circular(44))),
          ),
        ),
        Positioned(
          bottom: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 225,
                  child: Text(
                    nametheme.toUpperCase(),
                    style: const TextStyle(
                        color: ConstantsColors.iconColors,
                        fontSize: 32,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                Text(nameCategories,
                    style: const TextStyle(
                        color: ConstantsColors.iconColors,
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class MostPopularCategories extends StatelessWidget {
  // final int firstCategories;
  final String nameCategories;
  final String nameNotion;
  final dynamic background;
  final dynamic backGroundColor;
  final int isFirst;
  const MostPopularCategories({
    super.key,
    required this.background,
    required this.nameCategories,
    required this.nameNotion,
    required this.backGroundColor,
    required this.isFirst,
  });

  dynamic isFirsts() {
    if (isFirst == 0) {
      return Positioned(top: -9, child: Image.asset("asset/image/crown.png"));
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 8.0,
      ),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: Container(
            width: 180,
            height: 100,
            decoration: BoxDecoration(
                color: backGroundColor,
                borderRadius: BorderRadius.circular(21.5)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameCategories,
                        style:
                            const TextStyle(color: ConstantsColors.blackColors),
                      ),
                      Text(
                        nameNotion,
                        style: const TextStyle(
                            color: ConstantsColors.blackColors,
                            fontWeight: FontWeight.w900,
                            fontSize: 14),
                      ),
                      const Row(
                        children: <Widget>[
                          FaIcon(
                            FontAwesomeIcons.heart,
                            size: 10,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "3802",
                            style: TextStyle(fontSize: 10),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 18,
          left: 100,
          child: SizedBox(
            width: 90,
            height: 110,
            child: Image.asset(
              background,
              fit: BoxFit.cover,
            ),
          ),
        ),
        isFirsts()
      ]),
    );
  }
}
