import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  dynamic signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    if (gUser == null) return;

    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future signIn(String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future getIncrementCategories(int increment) async {
    var docSnapshots = await FirebaseFirestore.instance
        .collection('users')
        .doc('theo.saint-amand@orange.fr')
        .get();
    if (docSnapshots.exists) {
      Map<String, dynamic>? data = docSnapshots.data();
      var value = data?['currentPage'];
      increment = value;
      return increment;
    }
    return increment;
  }

  // Future getUserImage() async {
  //   var docSnapshots = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc('theo.saint-amand@orange.fr')
  //       .get();
  //   if (docSnapshots.exists) {
  //     Map<String, dynamic>? data = docSnapshots.data();
  //     var value = data?['imageUrl'];
  //     print(value);
  //     return value;
  //   }
  // }
}
