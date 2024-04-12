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
  String? pseudoUser;
  int? incrementUser;
  String? languageUser;
  List<String>? collection9;
  List? collection10;

  ThemeScreen(
      {super.key,
      this.pseudoUser,
      this.incrementUser,
      this.languageUser,
      this.collection9,
      this.collection10});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  int _selectedIndex = 0;
  late final List routes = [
    HomePage2(
      pseudoUser: widget.pseudoUser,
      increment: widget.incrementUser,
      collection7: widget.collection9,
      collection8: widget.collection10,
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
  List? collection8;
  List<String>? collection7;
  HomePage2({
    super.key,
    required this.pseudoUser,
    required this.increment,
    this.collection8,
    this.collection7,
  });

  @override
  State<HomePage2> createState() => _HomePage2State();
}

final controller =
    PageController(viewportFraction: 0.7, keepPage: true, initialPage: 3);

int currentPageIndex = 0;
int incrementCurrentCategory = 0;
// List user = [];
// List test2 = [];
// Future getUserImage() async {
//   var docSnapshots = await FirebaseFirestore.instance
//       .collection('users')
//       .doc('theo.saint-amand@orange.fr')
//       .get();
//   if (docSnapshots.exists) {
//     Map<String, dynamic>? data = docSnapshots.data();
//     var value = data?['favorite_theme'];
//     print('yo $value');
//     user = value;
//     for (var i = 0; i < user.length; i++) {
//       test2.add(user[i]);
//     }
//     print('bonjour $test2');
//     return user;
//   }
//   return user;
// }

List allCollection = [
  MongoDB.getDataCollectionAnime(),
  MongoDB.getDataCollectionManga(),
  MongoDB.getDataCollectionFilm(),
  MongoDB.getDataCollectionMusic(),
  MongoDB.getDataCollectionGaming(),
];
// 'collectionAnime',
//   'collectionAnime',
//   'collectionFilm',
//   'collectionMusic',
//   'collectionGaming',
// List<String> classement = [];
// List allCollectionUsers = [];
// void _generateUserLikedTheme() {
//   print(user);
//   print(test2);
//   for (var i = 0; i < 4; i++) {
//     print('20');
//     if (test2[i] == 'Manga') {
//       print('3');
//       allCollectionUsers.add(
//         MongoDB.getDataCollectionManga(),
//       );
//       classement.add('collectionManga');
//       i++;
//     } else if (test2[i] == 'Anime') {
//       allCollectionUsers.add(
//         MongoDB.getDataCollectionAnime(),
//       );
//       classement.add('collectionAnime');
//       i++;
//     } else if (test2[i] == 'Jeux Vidéo') {
//       allCollectionUsers.add(
//         MongoDB.getDataCollectionGaming(),
//       );
//       classement.add('collectionGaming');
//       i++;
//     } else if (test2[i] == 'Musique') {
//       allCollectionUsers.add(
//         MongoDB.getDataCollectionMusic(),
//       );
//       classement.add('collectionMusic');
//       i++;
//     } else {
//       allCollectionUsers.add(
//         MongoDB.getDataCollectionFilm(),
//       );
//       classement.add('collectionFilm');
//       i++;
//     }
//   }
//   print('bn ${allCollectionUsers[1]}');
//   print('bn ${allCollection[1]}');
// }

List allNameFields = ['title', 'title', '_name', 'name', 'name'];

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
    print(widget.collection8);
    print(widget.collection7);
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
                    backgroundImage: AssetImage('asset/image/iconProfile.png'),
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
                // const Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [],
                // )
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
                      itemCount: widget.collection8?.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayDataCategories(
                                snapshot2: widget.collection8![index],
                                collectionChoose: widget.collection7![index],
                                // a changer par widget.incrementUser!
                                incrementCategory: 1,
                              ),
                            ),
                          ),
                          // faire la meme chose pour categories.dart
                          child: CollectionMongoDB(
                            snapshot2: widget.collection8![index],
                            nameField: allNameFields[index],
                            collectionChoose: widget.collection7![index],
                            // a changer par widget.incrementUser!
                            incrementCategory: 1,
                            // nameField: allNameFields[index],
                          ),
                        );
                      }),
                ),
                SmoothPageIndicator(
                  controller: controller,
                  count: widget.collection8!.length,
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
