import 'package:flutter/material.dart';
import 'package:learnverse/view/home/categories_view.dart';
import 'package:learnverse/widgets/list_viewHome.dart';

//ignore: must_be_immutable
class CollectionMongoDB extends StatelessWidget {
  dynamic snapshot2;
  final String nameField;
  final String collectionChoose;
  final int incrementCategory;
  CollectionMongoDB(
      {super.key,
      required this.snapshot2,
      required this.nameField,
      required this.collectionChoose,
      required this.incrementCategory});
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
              if (collectionChoose == 'collectionFilm') {
                collection = ThemeChooseHome(
                  nametheme: snapshot.data[0]['results'][incrementCategory]
                      ['title'],
                  noteTheme: '12',
                  nameCategories: 'Movies',
                  backGroundTheme: snapshot.data[0]['results']
                      [incrementCategory]['backdrop_path'],
                );
              } else if (collectionChoose == 'collectionMusic') {
                collection = ThemeChooseHome(
                    nametheme: snapshot.data[0]['tracks'][0]['name'],
                    noteTheme: '12',
                    nameCategories: 'Music',
                    backGroundTheme: snapshot.data[0]['tracks'][0]['album']
                        ['images'][0]['url']);
              } else if (collectionChoose == 'collectionGaming') {
                collection = ThemeChooseHome(
                    nametheme: snapshot.data[0]['results'][incrementCategory]
                        ['name'],
                    noteTheme: '12',
                    nameCategories: 'Gaming',
                    backGroundTheme: snapshot.data[0]['results']
                        [incrementCategory]['background_image']);
              } else {
                collection = ThemeChooseHome(
                  nametheme: snapshot.data[incrementCategory][nameField],
                  noteTheme: '8',
                  nameCategories: 'Manga',
                  backGroundTheme: snapshot.data[incrementCategory]
                      ['main_picture']['medium'],
                );
              }
              return collection;
            } else {
              return Center(
                child: Container(
                    width: 250,
                    height: 300,
                    color: const Color.fromARGB(174, 255, 255, 255),
                    child: const Center(child: Text('No data available'))),
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
  final int incrementCategory;
  DisplayDataCategories(
      {super.key,
      required this.snapshot2,
      required this.collectionChoose,
      required this.incrementCategory});

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
              if (collectionChoose == 'collectionFilm') {
                collections = Categories(
                    title: snapshot.data[0]['results'][incrementCategory]
                        ['title'],
                    backgroundBanner: snapshot.data[0]['results']
                        [incrementCategory]['backdrop_path'],
                    synopsis: snapshot.data[0]['results'][incrementCategory]
                        ['overview'],
                    description: '',
                    categories: 'movie');
              } else if (collectionChoose == 'collectionGaming') {
                collections = Categories(
                  title: snapshot.data[0]['results'][incrementCategory]['name'],
                  backgroundBanner: snapshot.data[0]['results']
                      [incrementCategory]['background_image'],
                  synopsis: 'bonjour les enfants',
                  description: '',
                  categories: 'gaming',
                );
              } else {
                collections = Categories(
                  title: snapshot.data[incrementCategory]['title'],
                  backgroundBanner: snapshot.data[incrementCategory]
                      ['main_picture']['large'],
                  synopsis: snapshot.data[incrementCategory]['synopsis'],
                  description: '',
                  categories: 'manga',
                );
              }
              return collections;
            } else {
              return const Center(
                child: Text('No data available'),
              );
            }
          }
        });
  }
}
