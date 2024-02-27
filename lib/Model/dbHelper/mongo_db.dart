import 'package:learnverse/Model/dbHelper/constant.dart';
import 'package:learnverse/Model/dbHelper/insert_data.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDB {
  static dynamic db,
      userCollectionAnimals,
      userCollectionAnime,
      userCollectionFilm,
      userCollectionFood,
      userCollectionLivre,
      userCollectionManga,
      userCollectionMusic,
      userCollectionUserAccout;
  static connect() async {
    db = await Db.create(mongoConnUrl);
    await db.open();
    userCollectionAnimals = db.collection(userCollection1);
    userCollectionAnime = db.collection(userCollection2);
    userCollectionFilm = db.collection(userCollection3);
    userCollectionFood = db.collection(userCollection4);
    userCollectionLivre = db.collection(userCollection5);
    userCollectionManga = db.collection(userCollection6);
    userCollectionMusic = db.collection(userCollection10);
    userCollectionUserAccout = db.collection(userCollection11);
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
      return resultData;
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

  static Future<String> insertPseudo(MongoDbModel data) async {
    try {
      var resultData = await userCollectionUserAccout.insertOne(data.toJson());
      return resultData;
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
