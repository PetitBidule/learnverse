import 'package:flutter/material.dart';
import 'package:learnverse/view/categories_view.dart';
import 'package:learnverse/widgets/list_viewHome.dart';

//ignore: must_be_immutable
class CollectionMongoDB extends StatelessWidget {
  dynamic snapshot2;
  final String nameField;
  final String collectionChoose;
  CollectionMongoDB(
      {super.key,
      required this.snapshot2,
      required this.nameField,
      required this.collectionChoose});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: snapshot2,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              ThemeChooseHome collection;
              if (collectionChoose == "collectionFilm") {
                collection = ThemeChooseHome(
                  nametheme: snapshot.data[0]["results"][0]["title"],
                  noteTheme: "12",
                  nameCategories: "Movies",
                  backGroundTheme: snapshot.data[0]["results"][0]
                      ["backdrop_path"],
                );
              } else if (collectionChoose == "collectionMusic") {
                collection = ThemeChooseHome(
                    nametheme: snapshot.data[0]["tracks"][0]["name"],
                    noteTheme: "12",
                    nameCategories: "Music",
                    backGroundTheme: snapshot.data[0]["tracks"][0]["album"]
                        ["images"][0]["url"]);
              } else if (collectionChoose == "collectionGaming") {
                collection = ThemeChooseHome(
                    nametheme: snapshot.data[0]["results"][0]["name"],
                    noteTheme: "12",
                    nameCategories: "Manga",
                    backGroundTheme: snapshot.data[0]["results"][0]
                        ["background_image"]);
              } else {
                collection = ThemeChooseHome(
                    nametheme: snapshot.data[0][nameField],
                    noteTheme: "8",
                    nameCategories: "Manga",
                    backGroundTheme: snapshot.data[0]["main_picture"]
                        ["medium"]);
              }
              return collection;
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          }
        });
  }
}

//ignore: must_be_immutable
class DisplayDataCategories extends StatelessWidget {
  dynamic snapshot2;
  final String collectionChoose;
  DisplayDataCategories(
      {super.key, required this.snapshot2, required this.collectionChoose});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: snapshot2, // change juste la collection
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              Categories collections;
              if (collectionChoose == "collectionFilm") {
                collections = Categories(
                  title: snapshot.data[0]["results"][0]["title"],
                  backgroundBanner: snapshot.data[0]["results"][0]
                      ["backdrop_path"],
                  synopsis: snapshot.data[0]["results"][0]["overview"],
                );
              } else if (collectionChoose == "collectionGaming") {
                collections = Categories(
                  title: snapshot.data[0]["results"][0]["name"],
                  backgroundBanner: snapshot.data[0]["results"][0]
                      ["background_image"],
                  synopsis: "bonjour les enfants",
                );
              } else {
                collections = Categories(
                  title: snapshot.data[0]["title"],
                  backgroundBanner: snapshot.data[0]["main_picture"]["large"],
                  synopsis: snapshot.data[0]["synopsis"],
                );
              }
              return collections;
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          }
        });
  }
}
