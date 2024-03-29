import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learnverse/Model/dbHelper/display_data.dart';
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:learnverse/utils/constants.dart';
import 'package:learnverse/view/dashboard_view.dart';
import 'package:learnverse/view/settings_view.dart';
import 'package:learnverse/widgets/list_viewHome.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ThemeScreen extends StatefulWidget {
  late dynamic createAccount;
  String? pseudoUser;
  ThemeScreen({
    super.key,
    this.createAccount,
    this.pseudoUser,
  });

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  int _selectedIndex = 0;
  late final List routes = [
    HomePage2(
      pseudoUser: widget.pseudoUser,
    ),
    const Dashboard(),
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllConstants.backgroundContainer,
      body: routes[_selectedIndex],
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(203, 178, 254, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          child: GNav(
            selectedIndex: _selectedIndex,
            backgroundColor: const Color.fromRGBO(203, 178, 254, 1),
            activeColor: const Color.fromARGB(255, 228, 228, 228),
            tabBackgroundColor: const Color.fromARGB(38, 99, 85, 85),
            gap: 7,
            padding: const EdgeInsets.all(19),
            onTabChange: (index) => setState(() => _selectedIndex = index),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: "Home",
              ),
              GButton(
                icon: Icons.dashboard,
                text: "Dashboard",
              ),
              GButton(
                icon: Icons.settings,
                text: "Settings",
              ),
              GButton(
                icon: Icons.settings,
                text: "Like",
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HomePage2 extends StatefulWidget {
  String? pseudoUser;
  HomePage2({super.key, required this.pseudoUser});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

final controller =
    PageController(viewportFraction: 0.7, keepPage: true, initialPage: 3);

int currentPageIndex = 0;

List allCollection = [
  MongoDB.getDataCollectionAnime(),
  MongoDB.getDataCollectionManga(),
  MongoDB.getDataCollectionFilm(),
  MongoDB.getDataCollectionMusic(),
  MongoDB.getDataCollectionGaming(),
  // MongoDB.getDataCollectionUser(widget.pseudoUser),
];

List allNameFields = ["title", "title", "_name", "name", "name"];

List<String> classement = [
  "collectionAnime",
  "collectionManga",
  "collectionFilm",
  "collectionMusic",
  "collectionGaming",
  // "collectionUser"
];

List allThemes = [
  [
    "4.8",
    "Anime",
    "One Piece",
    "asset/image/zoro.png",
    "asset/image/zoro.png",
    const Color.fromRGBO(140, 178, 114, 1),
  ],
  [
    "4.9",
    "Manga",
    "One Piece",
    "asset/image/imageMan.png",
    "asset/image/imageMan.png",
    const Color.fromARGB(255, 255, 255, 255),
  ],
  [
    "4.6",
    "Music",
    "Dimanche",
    "asset/image/onepiecemanga.jpeg",
    "asset/image/sportbg.png",
    const Color.fromRGBO(140, 178, 114, 1),
  ],
];

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    backgroundImage: NetworkImage(
                        "https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExMHFpaHJyMHQ5bjlmYWNiNXB5eDF5ZXBpdG9scGRseWxoZmxkaGJ2cyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YRThiAEEYVNtC5acLO/giphy.gif"),
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
                  "Category of the Day",
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
                                collectionChoose: classement[index],
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
          SizedBox(
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
                        isFirst: index,
                      );
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
