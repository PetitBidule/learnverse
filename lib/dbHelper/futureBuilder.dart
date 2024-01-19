import 'package:flutter/material.dart';
import 'package:learnverse/dbHelper/mongoDB.dart';
import 'package:learnverse/screen/categories.dart';
import 'package:learnverse/widgets/listViewHome.dart';

class CollectionMongoDB extends StatelessWidget {
  var snapshot2;
  final String nameField;
  CollectionMongoDB(
      {super.key, required this.snapshot2, required this.nameField});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: snapshot2, // change juste la collection
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasData) {
              var totalData = snapshot.data.length;
              print(totalData.toString());
              return ThemeChooseHome(
                  nametheme: snapshot.data[0][nameField],
                  noteTheme: "4",
                  nameCategories: "Manga",
                  backGroundTheme: snapshot.data[0]["main_picture"]["medium"]);
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
              var totalData = snapshot.data.length;
              print(totalData.toString());
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
