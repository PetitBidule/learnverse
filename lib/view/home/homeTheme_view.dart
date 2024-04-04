import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:learnverse/Model/category_model.dart';
import 'package:learnverse/Model/dbHelper/display_data.dart';
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:learnverse/utils/constantsColors.dart';
import 'package:learnverse/utils/constantsFont.dart';
import 'package:learnverse/view/authentification/sign_out.dart';
import 'package:learnverse/view/dashboard_view.dart';
import 'package:learnverse/view/settings/settings_view.dart';
import 'package:learnverse/widgets/list_viewHome.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ThemeScreen extends StatefulWidget {
  late dynamic createAccount;
  String? pseudoUser;
  int? incrementUser;
  ThemeScreen(
      {super.key, this.createAccount, this.pseudoUser, this.incrementUser});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  int _selectedIndex = 0;
  late final List routes = [
    HomePage2(
      pseudoUser: widget.pseudoUser,
      increment: widget.incrementUser,
    ),
    const Dashboard(),
    const Setting(),
    const LogOutScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllConstants.backgroundContainer,
      body: routes[_selectedIndex],
      bottomNavigationBar: Container(
        color: const Color.fromRGBO(203, 178, 254, 1),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14),
          child: GNav(
            selectedIndex: _selectedIndex,
            backgroundColor: const Color.fromRGBO(203, 178, 254, 1),
            activeColor: ConstantsColors.iconColors,
            tabBackgroundColor: ConstantsColors.blackColors,
            gap: 7,
            padding: const EdgeInsets.all(16),
            onTabChange: (index) => setState(() => _selectedIndex = index),
            tabs: [
              GButton(
                icon: Icons.home,
                text: AppLocalizations.of(context)!.navigationBarItem1,
              ),
              GButton(
                icon: Icons.dashboard,
                text: AppLocalizations.of(context)!.navigationBarItem2,
              ),
              GButton(
                icon: Icons.settings,
                text: AppLocalizations.of(context)!.navigationBarItem3,
              ),
              GButton(
                icon: Icons.login_rounded,
                text: AppLocalizations.of(context)!.navigationBarItem4,
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
  int? increment;
  HomePage2({super.key, required this.pseudoUser, required this.increment});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

final controller =
    PageController(viewportFraction: 0.7, keepPage: true, initialPage: 3);

int currentPageIndex = 0;
int incrementCurrentCategory = 0;

List allCollection = [
  MongoDB.getDataCollectionAnime(),
  MongoDB.getDataCollectionManga(),
  MongoDB.getDataCollectionFilm(),
  MongoDB.getDataCollectionMusic(),
  MongoDB.getDataCollectionGaming(),
];
List allNameFields = ['title', 'title', '_name', 'name', 'name'];

List<String> classement = [
  'collectionAnime',
  'collectionManga',
  'collectionFilm',
  'collectionMusic',
  'collectionGaming',
  // "collectionUser"
];

List<MostPopularCategory> categoriesComponents = [
  MostPopularCategory(
    name: 'One Piece',
    note: 4,
    categories: 'Manga',
    backgroundImage: 'asset/image/zoro.png',
    backGroundColor: const Color.fromRGBO(140, 178, 114, 1),
  ),
  MostPopularCategory(
    name: 'Naruto',
    note: 4,
    categories: 'Anime',
    backgroundImage: 'asset/image/imageMan.png',
    backGroundColor: const Color.fromRGBO(240, 248, 255, 1),
  ),
  MostPopularCategory(
    name: 'Handball',
    note: 4,
    categories: 'Sport',
    backgroundImage: 'asset/image/sportbg.png',
    backGroundColor: const Color.fromRGBO(255, 255, 255, 1),
  ),
  MostPopularCategory(
    name: 'GTA',
    note: 4,
    categories: 'Gaming',
    backgroundImage: 'asset/image/imageG.png',
    backGroundColor: const Color.fromRGBO(0, 223, 255, 1),
  ),
  MostPopularCategory(
    name: 'KOC',
    note: 4,
    categories: 'Music',
    backgroundImage: 'asset/image/imageMu.png',
    backGroundColor: const Color.fromRGBO(252, 188, 188, 1),
  )
];

class _HomePage2State extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                        AssetImage('asset/image/logoLearnVerse.png'),
                    minRadius: 28,
                    maxRadius: 28,
                  ),
                ),
                SizedBox(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://media3.giphy.com/media/v1.Y2lkPTc5MGI3NjExMHFpaHJyMHQ5bjlmYWNiNXB5eDF5ZXBpdG9scGRseWxoZmxkaGJ2cyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/YRThiAEEYVNtC5acLO/giphy.gif'),
                    minRadius: 28,
                    maxRadius: 28,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.homeThemesTitle,
                  style: AllConstants.text,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.50,
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
                                incrementCategory: widget.increment!,
                              ),
                            ),
                          ),
                          // faire la meme chose pour categories.dart
                          child: CollectionMongoDB(
                            snapshot2: allCollection[index],
                            nameField: allNameFields[index],
                            collectionChoose: classement[index],
                            incrementCategory: widget.increment!,
                            // nameField: allNameFields[index],
                          ),
                        );
                      }),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: allCollection.length,
                  textDirection: TextDirection.ltr,
                  effect: const ExpandingDotsEffect(
                    dotWidth: 12,
                    dotHeight: 12,
                    dotColor: ConstantsColors.iconColors,
                    activeDotColor: Color.fromRGBO(218, 182, 252, 1),
                    spacing: 8,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
            child: Row(
              children: [
                Text(
                  AppLocalizations.of(context)!.homeThemesMostPopularCategory,
                  style: AllConstants.text,
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
                    itemCount: categoriesComponents.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MostPopularCategories(
                        nameCategories: categoriesComponents[index].categories,
                        nameNotion: categoriesComponents[index].name,
                        background: categoriesComponents[index].backgroundImage,
                        backGroundColor:
                            categoriesComponents[index].backGroundColor,
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
