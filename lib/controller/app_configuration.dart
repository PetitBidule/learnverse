// import 'package:realm/realm.dart';

// AppConfiguration(
//   this.appId, {
//   Uri? baseUrl,
//   Directory? baseFilePath,
//   this.defaultRequestTimeout = const Duration(seconds: 60),
//   this.localAppName,
//   this.localAppVersion,
//   this.metadataEncryptionKey,
//   this.metadataPersistenceMode = MetadataPersistenceMode.plaintext,
//   this.maxConnectionTimeout = const Duration(minutes: 2),
//   HttpClient? httpClient,
// })  : baseUrl = baseUrl ?? Uri.parse('https://realm.mongodb.com'),
//       baseFilePath = baseFilePath ?? Directory(_path.dirname(Configuration.defaultRealmPath)),
//       httpClient = httpClient ?? _defaultClient {
//   if (appId == '') {
//     throw RealmException('Supplied appId must be a non-empty value');
//   }
// }
import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:realm/realm.dart';

class UserFunctions {
  static String? userId;
  static final app = App(AppConfiguration('learneverse-ydjls'));

  static Future<void> loginUser(String email, String password) async {
    final user = await app.logIn(Credentials.emailPassword(email, password));
    print(user.id);
    userId = user.id;
    // MongoDB.insertData(userId);
    // userId = user.id;
    // await updatePreferences({"theme": "dark", "language": "en"});
  }

  static Future<void> logoutUser() async {
    // await app.currentUser!.logOut();
    // print("l'utilisateur c'est déco ce chien de merde");
    // final currentUser = app.currentUser!;
    // await app.deleteUser(currentUser);

    await app.currentUser!.logOut();

    print("l'utilisateur a supprimer son compte ce sale chien");
  }

  // static Future<void> insertData() async {
  //   try {
  //     // insertData(user.id);
  //   } catch (e) {
  //     print(e);
  //   }
  //   // final user = app.currentUser!;
  //   // final updatedCustomUserData = {
  //   //   "userId": user.id,
  //   //   "favoriteFood": "pizza",
  //   // };

  //   // final functionResponse = await user.functions
  //   //     .call("writeCustomUserData", [updatedCustomUserData]);
  //   // final customUserData = await user.refreshCustomData();
  // }
  // static Future<void> updatePreferences(
  //     Map<String, dynamic> preferences) async {
  // }
}
