import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/screen/categories.dart';
import 'package:learnverse/screen/dashboard.dart';
import 'package:learnverse/screen/settings.dart';
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
  final controller =
      PageController(viewportFraction: 0.7, keepPage: true, initialPage: 3);
  int currentPageIndex = 0;

  List allThemes = [
    ["4.5", "Manga", "One Piece", "asset/image/onepiecemanga.jpeg", "1"],
    ["4.3", "Série", "Breaking Bad", "asset/image/breakingbad.jpeg", 2],
    ["4.1", "Manhwa", "Solo Leveling", "asset/image/sololevening.jpeg", 3],
    ["4.9", "Anime", "Cote", "asset/image/cote.jpeg", 4],
    ["2.5", "Sport", "Hockey", "asset/image/hockey.jpg", 5],
    ["4.7", "Film", "Avatar", "asset/image/avatar.jpeg", 6],
    ["4.5", "Animals", "Dauphin", "asset/image/dauphin.jpeg", 7],
  ];
  List classement = [
    1,
    2,
    3,
    4,
    5,
    6,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(117, 123, 200, 1),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      backgroundImage: AssetImage("asset/image/Profil.png"),
                      minRadius: 30,
                      maxRadius: 30,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: const Text(
                      "Categories Of The day",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  Container(
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Next 18.40",
                          style: TextStyle(color: Colors.white, fontSize: 19),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 435,
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
                  // const SizedBox(
                  //   height: 35,
                  // ),
                  SmoothPageIndicator(
                      controller: controller, // PageController
                      count: allThemes.length,
                      textDirection: TextDirection.ltr,
                      effect: const ExpandingDotsEffect(
                        dotWidth: 13,
                        dotHeight: 13,
                        dotColor: Colors.white,
                        activeDotColor: Color.fromRGBO(218, 182, 252, 1),
                        spacing: 10,
                      ),
                      onDotClicked: (index) {}),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Text(
                    "Most Popular Categories",
                    style:
                        TextStyle(color: AllConstants.textColors, fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: SizedBox(
                height: 110,
                child: Stack(
                  children: [
                    ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: allThemes.length,
                        itemBuilder: (BuildContext context, int index) {
                          return MostPopularCategories(
                              firstCategories: classement[0]);
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 100,
        padding: const EdgeInsets.only(bottom: 30, left: 30, right: 30),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const SingleChildScrollView(child: BottomNavBar())),
      ),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      // Navigator.pushNamed(context, '/hotels');
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 10,
      iconSize: 34,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromRGBO(203, 178, 254, 1), // <-- HERE
      showUnselectedLabels: false,
      showSelectedLabels: false,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: 'Hotels',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: 'Parameters',
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}
