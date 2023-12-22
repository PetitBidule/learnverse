import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/screen/categories.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/widgets/listViewHome.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  // CarouselController buttonCarouselController = CarouselController();
  final controller = PageController(viewportFraction: 0.7, keepPage: true);

  List allThemes = [
    ["4.5", "Manga", "One Piece", "asset/image/onepiecemanga.jpeg"],
    ["4.3", "Série", "Breaking Bad", "asset/image/breakingbad.jpeg"],
    ["4.1", "Manwhua", "Solo Leveling", "asset/image/sololevening.jpeg"],
    ["3.5", "Anime", "Cote", "asset/image/cote.jpeg"],
    ["2.5", "Sport", "Hockey", "asset/image/hockey.jpg"],
    ["4.7", "Film", "Avatar", "asset/image/avatar.jpeg"],
    ["4.5", "Animals", "Dauphin", "asset/image/dauphin.jpeg"],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(117, 123, 200, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 160,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: AllConstants.textColors),
                      color: const Color.fromARGB(0, 155, 39, 176),
                      borderRadius: BorderRadius.circular(38)),
                  child: const Row(children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        minRadius: 25,
                        maxRadius: 25,
                        backgroundColor: Color.fromRGBO(203, 178, 254, 1),
                        child: Icon(
                          Icons.search,
                          color: AllConstants.textColors,
                        ),
                      ),
                    ),
                    Text(
                      'Search',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                    )
                  ]),
                ),
                const SizedBox(
                  child: CircleAvatar(
                    minRadius: 30,
                    maxRadius: 30,
                  ),
                )
              ],
            ),
            Container(
              child: const Text("Catégories of the day"),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: SizedBox(
                      height: 450,
                      child: PageView.builder(
                          controller: controller,
                          itemCount: allThemes.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Categories(
                                        title: allThemes[index][2],
                                        backgroundBanner: allThemes[index][3])),
                              ),
                              child: ThemeChooseHome(
                                noteTheme: allThemes[index][0],
                                nametheme: allThemes[index][1],
                                nameCategories: allThemes[index][2],
                                backGroundTheme: allThemes[index][3],
                              ),
                            );
                          }),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 35,
                  // ),
                  SmoothPageIndicator(
                      controller: controller, // PageController
                      count: allThemes.length,
                      textDirection: TextDirection.ltr,
                      effect: const ScrollingDotsEffect(
                        fixedCenter: true,
                        dotColor: Colors.white,
                        activeDotColor: Color.fromRGBO(218, 182, 252, 1),
                        maxVisibleDots: 5,
                        spacing: 12,
                      ), // your preferred effect
                      onDotClicked: (index) {})
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: const Color.fromRGBO(145, 144, 236, 0),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        backgroundColor: const Color.fromRGBO(145, 144, 236, 1),
        destinations: const [
          NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.house,
                size: 30,
                color: Colors.white,
              ),
              label: ""),
          NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.chartPie,
                size: 30,
              ),
              label: ""),
          NavigationDestination(
              icon: FaIcon(
                FontAwesomeIcons.gear,
                size: 30,
              ),
              label: ""),
        ],
      ),
    );
  }
}
