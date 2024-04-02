import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learnverse/view/dashboard_view.dart';
import 'package:lottie/lottie.dart';

class Categories extends StatefulWidget {
  final String title;
  final String synopsis;
  final dynamic backgroundBanner;
  final String description;
  final String categories;

  const Categories(
      {super.key,
      required this.title,
      required this.backgroundBanner,
      required this.synopsis,
      required this.description,
      required this.categories});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> with TickerProviderStateMixin {
  bool _isLike = false;
  bool _isFavorite = false;
  bool _isLikeComment = false;
  final List<String> titleFav = [];
  int _incrementCommentUser = 0;
  var db = FirebaseFirestore.instance;
  late var incrementLike = db
      .collection("comment")
      .doc(widget.categories)
      .collection(widget.title)
      .doc();
  late final AnimationController _controllerLike;
  late final AnimationController _controllerFavorite;
  final TextEditingController _controller = TextEditingController();
  void _showToast(BuildContext context) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const FaIcon(
            FontAwesomeIcons.check,
            size: 15,
            color: Colors.white,
          ),
          const Text('Added to wishlist.'),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Dashboard()),
              );
            },
            child: const Text(
              "View wishlist",
              style: TextStyle(color: Color.fromARGB(255, 255, 175, 71)),
            ),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 180,
          left: 10,
          right: 10),
      backgroundColor: const Color.fromARGB(255, 117, 123, 200),
      // duration: Durations.short1,
    ));
  }

  List allComments = [];
  List allUser = [];
  List allImageUser = [];
  List allDateUser = [];
  List allLikeUser = [];
  Future getComment(String categories, String anime) async {
    await db.collection("comment").doc(categories).collection(anime).get().then(
          (comments) => {
            for (var comment in comments.docs)
              {
                allComments.add(comment.data()["comment"]),
                allUser.add(comment.data()["user"]),
                allImageUser.add(comment.data()["urlImage"]),
                allDateUser.add(comment.data()["timeStamp"]),
                allLikeUser.add(comment.data()["like"]),
              }
          },
          onError: (e) => print('Error: ${e.message}'),
        );
  }

  @override
  void initState() {
    super.initState();
    _controllerLike =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    _controllerFavorite =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    _controllerLike.dispose();
    _controllerFavorite.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    image: widget.title == "Napoleon"
                        ? NetworkImage(
                            "https://image.tmdb.org/t/p/w500/${widget.backgroundBanner}")
                        : NetworkImage(widget.backgroundBanner),
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
                        ]),
                  ),
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
                        CircleAvatar(
                          minRadius: 30,
                          maxRadius: 30,
                          backgroundImage: NetworkImage(
                              "${FirebaseAuth.instance.currentUser?.photoURL}"),
                        )
                      ]),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 475,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Color.fromRGBO(117, 123, 200, .20),
                          Color.fromRGBO(117, 123, 200, .45),
                          Color.fromRGBO(117, 123, 200, .70),
                          Color.fromRGBO(117, 123, 200, .80),
                          Color.fromRGBO(117, 123, 200, .90),
                          Color.fromRGBO(117, 123, 200, 1),
                          Color.fromRGBO(117, 123, 200, 1),
                          Color.fromRGBO(117, 123, 200, 1),
                          Color.fromRGBO(117, 123, 200, 1),
                          Color.fromRGBO(117, 123, 200, 1),
                          Color.fromRGBO(117, 123, 200, 1),
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(117, 123, 200, .85),
                          spreadRadius: 50,
                          blurRadius: 100,
                          offset: Offset(0, -30), // changes position of shadow
                        ),
                      ],
                    ),
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
                                width: 225,
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
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: IconButton(
                                        onPressed: () => setState(() {
                                              allComments.clear();

                                              if (_isLike == false) {
                                                _isLike = true;
                                                _controllerLike.forward();
                                              } else {
                                                _isLike = false;
                                                _controllerLike.reverse();
                                              }
                                            }),
                                        icon: Lottie.network(
                                            "https://lottie.host/ad6f0cd6-10ce-40cd-84f4-f1044a254299/oSmNtNSKDJ.json",
                                            controller: _controllerLike,
                                            width: 30,
                                            height: 30)),
                                  ),
                                  const SizedBox(width: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            allComments.clear();

                                            if (_isFavorite == false) {
                                              _isFavorite = true;
                                              _controllerFavorite.forward();
                                              _showToast(context);
                                            } else {
                                              _isFavorite = false;
                                              _controllerFavorite.reverse();
                                            }
                                            titleFav.add(widget.title);
                                            db
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
                                        icon: Lottie.network(
                                            "https://lottie.host/d69a82ec-02b6-4ef1-bd02-c0411f6d8613/IhsBGlTAAY.json",
                                            controller: _controllerFavorite,
                                            width: 30,
                                            height: 30)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // update text
                            Text(
                              'Synopsis',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                            Text(
                              'Theme',
                              style: TextStyle(
                                  color: Color.fromARGB(181, 255, 255, 255),
                                  fontSize: 19),
                            ),
                            Text(
                              'More Information',
                              style: TextStyle(
                                  color: Color.fromARGB(181, 255, 255, 255),
                                  fontSize: 19),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        indent: 60,
                        endIndent: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: SizedBox(
                          height: 276,
                          child: ListView(
                            children: [
                              const Text("Synopsis",
                                  style: TextStyle(
                                      fontSize: 24, color: Colors.white)),
                              const SizedBox(
                                height: 30,
                              ),
                              Text(
                                widget.synopsis,
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              TextField(
                                controller: _controller,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                    hintText: "Comment",
                                    fillColor: Colors.white),
                              ),
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      allComments.clear();
                                      _incrementCommentUser++;
                                      db
                                          .collection("comment")
                                          .doc(widget.categories)
                                          .collection(widget.title)
                                          .doc(
                                              "${FirebaseAuth.instance.currentUser?.email} ($_incrementCommentUser)")
                                          .set({
                                        // displayName marche que pour les compte google
                                        "user": FirebaseAuth
                                            .instance.currentUser?.displayName,
                                        "comment": _controller.text,
                                        "urlImage": FirebaseAuth
                                            .instance.currentUser?.photoURL,
                                        "timeStamp":
                                            FieldValue.serverTimestamp(),
                                        "like": 0,
                                      });
                                    });
                                  },
                                  child: const Text('Submit')),
                              const Divider(),
                              FutureBuilder(
                                  future: getComment(
                                      widget.categories, widget.title),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      return SizedBox(
                                        height: 400,
                                        child: ListView.builder(
                                            itemCount: allComments.length,
                                            itemBuilder: (context, int index) {
                                              return ListTile(
                                                  leading: CircleAvatar(
                                                    backgroundImage:
                                                        NetworkImage(
                                                            allImageUser[
                                                                index]),
                                                  ),
                                                  title: Text(allUser[index]),
                                                  subtitle:
                                                      Text(allComments[index]),
                                                  trailing: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            for (var i = 0;
                                                                i <
                                                                    allComments
                                                                        .length;
                                                                i++) {
                                                              if (allLikeUser[
                                                                      i] ==
                                                                  false) {
                                                                _isLikeComment =
                                                                    true;
                                                              } else {
                                                                _isLikeComment =
                                                                    false;
                                                              }
                                                            }
                                                          });

                                                          // db.collection("comment")
                                                          //     .doc(widget
                                                          //         .categories)
                                                          //     .collection(
                                                          //         widget.title)
                                                          //     .
                                                          //     .update({
                                                          //   "like": FieldValue
                                                          //       .increment(50)
                                                          // });
                                                        },
                                                        child: _isLikeComment ==
                                                                false
                                                            ? const FaIcon(
                                                                FontAwesomeIcons
                                                                    .heart,
                                                                size: 15,
                                                              )
                                                            : const FaIcon(
                                                                FontAwesomeIcons
                                                                    .heart,
                                                                size: 15,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                      ),
                                                      Text(
                                                          "${allLikeUser[index]}")
                                                    ],
                                                  ));
                                            }),
                                      );
                                    }
                                    return const CircularProgressIndicator();
                                  })
                            ],
                          ),
                        ),
                      ),
                      // const VideoPlayer(),
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
