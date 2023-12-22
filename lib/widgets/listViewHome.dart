import 'package:flutter/material.dart';
import 'package:learnverse/utils/constants.dart';

class ThemeChooseHome extends StatelessWidget {
  final String noteTheme;
  final String nametheme;
  final String nameCategories;
  final String backGroundTheme;
  const ThemeChooseHome(
      {super.key,
      required this.noteTheme,
      required this.nametheme,
      required this.nameCategories,
      required this.backGroundTheme});

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
              image: AssetImage(backGroundTheme), fit: BoxFit.cover)),
      child: Stack(children: [
        Positioned(
          top: 20,
          left: 20,
          child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: AllConstants.textColors),
                  color: const Color.fromARGB(140, 0, 0, 0),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text(
                  noteTheme,
                  style: const TextStyle(color: AllConstants.textColors),
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
                    colors: [Colors.black, Color.fromARGB(0, 0, 0, 0)]),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(44),
                    bottomRight: Radius.circular(44))),
          ),
        ),
        Positioned(
          bottom: 30,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nametheme.toUpperCase(),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 32,
                      fontWeight: FontWeight.w700),
                ),
                Text(nameCategories,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
        // Positioned(
        //     bottom: 0,
        //     right: 0,
        //     child: Container(
        //       width: 63,
        //       height: 63,
        //       decoration: const BoxDecoration(
        //           color: Color.fromRGBO(145, 144, 236, 1),
        //           borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(30),
        //               bottomRight: Radius.circular(44))),
        //       child: IconButton(
        //         onPressed: () {},
        //         icon: const Icon(
        //           Icons.play_arrow_rounded,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ))
      ]),
    );
  }
}
