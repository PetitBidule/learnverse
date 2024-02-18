import 'package:flutter/material.dart';
import 'package:learnverse/Model/dbHelper/display_data.dart';
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/widgets/list_viewHome.dart';
import 'package:learnverse/widgets/navigation_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//ignore: must_be_immutable
class ThemeScreen extends StatefulWidget {
  late dynamic createAccount;
  late dynamic pseudoUser;
  ThemeScreen({super.key, this.createAccount, this.pseudoUser});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  final controller =
      PageController(viewportFraction: 0.7, keepPage: true, initialPage: 3);

  int currentPageIndex = 0;

  late List allCollection = [
    MongoDB.getDataCollectionAnime(),
    MongoDB.getDataCollectionManga(),
    MongoDB.getDataCollectionFilm(),
    MongoDB.getDataCollectionMusic(),
    MongoDB.getDataCollectionUser(widget.pseudoUser),
  ];

  List allNameFields = ["title", "title", "_name", "name", "pseudo"];

  List<String> classement = [
    "collectionAnime",
    "collectionManga",
    "collectionFilm",
    "collectionMusic",
    "collectionUser"
  ];

  List allThemes = [
    [
      "4.5",
      "Manga",
      "One Piece",
      "asset/image/onepiecemanga.jpeg",
      "asset/image/onePieceZoro.png",
      const Color.fromRGBO(140, 178, 114, 1),
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllConstants.backgroundContainer,
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
                        border: Border.all(color: Colors.white),
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
                            color: Colors.white,
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
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories Of The day",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next 18.40",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
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
                        itemCount: allCollection.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DisplayDataCategories(
                                  snapshot2: allCollection[index],
                                ),
                              ),
                            ),
                            // faire la meme chose pour categories.dart
                            child: CollectionMongoDB(
                              snapshot2: allCollection[index],
                              nameField: allNameFields[index],
                              collectionChoose: classement[index],
                              // nameField: allNameFields[index],
                            ),
                          );
                        }),
                  ),
                  SmoothPageIndicator(
                    controller: controller, // PageController
                    count: allCollection.length,
                    textDirection: TextDirection.ltr,
                    effect: const ExpandingDotsEffect(
                      dotWidth: 13,
                      dotHeight: 13,
                      dotColor: Colors.white,
                      activeDotColor: Color.fromRGBO(218, 182, 252, 1),
                      spacing: 10,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  Text(
                    "Most Popular Categories",
                    style: AllConstants.textColors,
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
                            nameCategories: allThemes[index][1],
                            nameNotion: allThemes[index][2],
                            background: allThemes[index][4],
                            backGroundColor: allThemes[index][5],
                          );
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const NavigationBarBottom(),
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
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.dashboard),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
          ),
          label: '',
        ),
      ],
      selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
    );
  }
}
