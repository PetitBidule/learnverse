import 'dart:developer';

import 'package:learnverse/dbHelper/constant.dart';
import 'package:learnverse/dbHelper/insertData.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDB {
  // static var valuePseudoUser;

  // const MongoDB({required valuePseudoUser});
  static var db,
      userCollectionAnimals,
      userCollectionAnime,
      userCollectionFilm,
      userCollectionFood,
      userCollectionLivre,
      userCollectionManga,
      userCollectionMusic,
      userCollectionUserAccout;
  static connect() async {
    print("object");
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollectionAnimals = db.collection(USER_COLLECTION1);
    userCollectionAnime = db.collection(USER_COLLECTION2);
    userCollectionFilm = db.collection(USER_COLLECTION3);
    userCollectionFood = db.collection(USER_COLLECTION4);
    userCollectionLivre = db.collection(USER_COLLECTION5);
    userCollectionManga = db.collection(USER_COLLECTION6);
    userCollectionMusic = db.collection(USER_COLLECTION10);
    userCollectionUserAccout = db.collection(USER_COLLECTION11);
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

  static Future<List<Map<String, dynamic>>> getDataCollectionMusic() async {
    final arrData = await userCollectionMusic.find().toList();
    return arrData;
  }

  static Future<List<Map<String, dynamic>>> getDataCollectionUser(
      valuePseudoUser) async {
    final arrData = await userCollectionUserAccout
        .find({"pseudo": valuePseudoUser}).toList();
    return arrData;
  }

  static Future<String> insert(MongoDbModel data) async {
    try {
      var resultData = await userCollectionUserAccout.insertOne(data.toJson());
      print("grandkiwijaune");
      return 'yo';
      // if (resultData.isSuccess) {
      //   print("c'est bon la création du compte est terminée");
      //   return "c'est bon la création du compte est terminée";
      // } else {
      //   return "ca ne marche pas";
      // }
    } catch (e) {
      print(e.toString());
      return "$e";
    }
  }
}
