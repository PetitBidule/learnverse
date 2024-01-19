import 'dart:developer';

import 'package:learnverse/dbHelper/constant.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDB {
  static var db,
      userCollectionAnimals,
      userCollectionAnime,
      userCollectionFilm,
      userCollectionFood,
      userCollectionLivre,
      userCollectionManga;
  static connect() async {
    print("object");
    db = await Db.create(MONGO_CONN_URL);
    print("object1");

    await db.open();
    inspect(db);
    userCollectionAnimals = db.collection(USER_COLLECTION1);
    userCollectionAnime = db.collection(USER_COLLECTION2);
    userCollectionFilm = db.collection(USER_COLLECTION3);
    userCollectionFood = db.collection(USER_COLLECTION4);
    userCollectionLivre = db.collection(USER_COLLECTION5);
    userCollectionManga = db.collection(USER_COLLECTION6);
  }

  static Future<List<Map<String, dynamic>>> getDataCollectionAnimals() async {
    final arrData = await userCollectionAnimals.find().toList();
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getDataCollectionAnime() async {
    final arrData = await userCollectionAnime.find().toList();
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getDataCollectionFilm() async {
    final arrData = await userCollectionFilm.find().toList();
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getDataCollectionFood() async {
    final arrData = await userCollectionFood.find().toList();
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getDataCollectionLivre() async {
    final arrData = await userCollectionLivre.find().toList();
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getDataCollectionManga() async {
    final arrData = await userCollectionManga.find().toList();
    return arrData;
  }
}
