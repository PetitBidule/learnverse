// import 'package:realm/realm.dart';

import 'package:learnverse/Model/dbHelper/mongo_db.dart';
import 'package:realm/realm.dart';

class UserFunctions {
  static String? userId;
  static final app = App(AppConfiguration('learneverse-ydjls'));

  static Future<void> loginUser(String email, String password) async {
    final user = await app.logIn(Credentials.emailPassword(email, password));
    print(user.id);
    userId = user.id;
  }

  static Future<void> logoutUser() async {
    await app.currentUser!.logOut();
    print("l'utilisateur a supprimer son compte ce sale chien");
  }
}
