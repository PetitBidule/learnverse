import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) =>
    MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
  ObjectId id;
  String pseudo;
  String email;
  String password;

  MongoDbModel({
    required this.id,
    required this.pseudo,
    required this.email,
    required this.password,
  });

  factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        id: json["_id"],
        pseudo: json["pseudo"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "pseudo": pseudo,
        "email": email,
        "password": password,
      };
}
