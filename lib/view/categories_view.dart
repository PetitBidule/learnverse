import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnverse/utils/constants.dart';

class Categories extends StatefulWidget {
  final String title;
  final String synopsis;
  final dynamic backgroundBanner;

  const Categories({
    super.key,
    required this.title,
    required this.backgroundBanner,
    required this.synopsis,
  });

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  bool _isLike = false;
  bool _isFavorite = false;
  final List<String> titleFav = [];
  List<Map> videos = [
    {
      'url': 'url',
      'name': 'Harry',
    },
    {
      'url': 'url',
      'name': 'John',
    }
  ];
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FaIcon(
            FontAwesomeIcons.check,
            size: 15,
            color: Colors.white,
          ),
          Text('Added to wishlist.'),
          Text(
            "View wishlist",
            style: TextStyle(color: Color.fromARGB(255, 255, 175, 71)),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 150,
          left: 10,
          right: 10),
      backgroundColor: const Color.fromARGB(255, 117, 123, 200),
      duration: Durations.short1,
    ));
  }

  @override
  Widget build(BuildContext context) {
    const String svgEffectBorder =
        '''<svg xmlns="http://www.w3.org/2000/svg" width="62" height="46" viewBox="0 0 62 46" fill="none">
  <path d="M0.0715294 46L62 46C14.2824 46 1.13029 20.325 0.0715299 4.214L0.0715299 6.8909e-06C-0.0208163 1.30331 -0.0268206 2.71739 0.0715299 4.214L0.0715294 46Z" fill="#757BC8"/>
</svg>''';
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(widget.backgroundBanner),
                    fit: BoxFit.cover,
                  )),
                ),
                Container(
                  height: 200,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color.fromARGB(223, 0, 0, 0),
                        Color.fromARGB(155, 0, 0, 0),
                        Color.fromARGB(120, 0, 0, 0),
                        Color.fromARGB(60, 0, 0, 0),
                        Color.fromARGB(0, 0, 0, 0)
                      ])),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                              onPressed: () => setState(() {
                                    Navigator.pop(context);
                                  }),
                              icon: const FaIcon(
                                FontAwesomeIcons.chevronLeft,
                                size: 23,
                                color: Colors.white,
                              )),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        const CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          backgroundImage: AssetImage("asset/image/Profil.png"),
                        )
                      ]),
                ),
                Positioned(
                  top: 368,
                  left: 0,
                  child: SvgPicture.string(
                    svgEffectBorder,
                    height: 70,
                    width: 70,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 400,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 117, 123, 200),
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(50))),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 250,
                                child: Text(
                                  widget.title,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 24),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            203, 178, 254, 1),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: IconButton(
                                        onPressed: () => setState(() {
                                              if (_isLike == false) {
                                                _isLike = true;
                                              } else {
                                                _isLike = false;
                                              }
                                            }),
                                        icon: _isLike == false
                                            ? const FaIcon(
                                                FontAwesomeIcons.heart,
                                                color: Colors.white,
                                                size: 30,
                                              )
                                            : const FaIcon(
                                                FontAwesomeIcons.solidHeart,
                                                color: Colors.white,
                                                size: 30,
                                              )),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            203, 178, 254, 1),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (_isFavorite == false) {
                                              _isFavorite = true;
                                              _showToast(context);
                                            } else {
                                              _isFavorite = false;
                                            }
                                            titleFav.add(widget.title);
                                            FirebaseFirestore.instance
                                                .collection('users')
                                                .doc(FirebaseAuth.instance
                                                    .currentUser?.email)
                                                .update(
                                              {
                                                "watchlist":
                                                    FieldValue.arrayUnion([
                                                  {
                                                    'url':
                                                        widget.backgroundBanner,
                                                    'name': widget.title,
                                                  },
                                                ])
                                              },
                                            );
                                          });
                                        },
                                        icon: _isFavorite == false
                                            ? const FaIcon(
                                                FontAwesomeIcons.bookmark,
                                                color: Colors.white,
                                                size: 30,
                                              )
                                            : const FaIcon(
                                                FontAwesomeIcons.solidBookmark,
                                                color: Colors.white,
                                                size: 30,
                                              )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: SizedBox(
                          height: 276,
                          child: ListView(
                            children: [
                              Text(
                                widget.synopsis,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              const Text('Information'),
                            ],
                          ),
                        ),
                      )
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
