import 'package:flutter/material.dart';
import 'package:learnverse/view/categories_view.dart';
import 'package:learnverse/widgets/listViewHome.dart';

class CollectionMongoDB extends StatelessWidget {
  var snapshot2;
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
        future: snapshot2, // change juste la collection
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
                    nameCategories: "Manga",
                    backGroundTheme: snapshot.data[0]["results"][0]
                        ["backdrop_path"]);
              } else if (collectionChoose == "collectionMusic") {
                collection = ThemeChooseHome(
                    nametheme: snapshot.data[0]["tracks"][0]["name"],
                    noteTheme: "12",
                    nameCategories: "Manga",
                    backGroundTheme: snapshot.data[0]["tracks"][0]["album"]
                        ["images"][0]["url"]);
              } else if (collectionChoose == "collectionUser") {
                collection = const ThemeChooseHome(
                    nametheme: "kiwi",
                    noteTheme: "12",
                    nameCategories: "Manga",
                    backGroundTheme: "");
              } else {
                collection = ThemeChooseHome(
                    nametheme: snapshot.data[0][nameField],
                    noteTheme: "23334",
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

class DisplayDataCategories extends StatelessWidget {
  var snapshot2;
  DisplayDataCategories({
    super.key,
    required this.snapshot2,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: snapshot2, // change juste la collection
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              return Categories(
                title: snapshot.data[0]["title"],
                backgroundBanner: snapshot.data[0]["main_picture"]["large"],
                synopsis: snapshot.data[0]["synopsis"],
              );
            } else {
              return const Center(
                child: Text("No data available"),
              );
            }
          }
        });
  }
}
