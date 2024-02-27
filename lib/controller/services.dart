import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// class AuthService {
//   signInWithGoogle() async {
//     final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

//     final GoogleSignInAuthentication gAuth = await gUser!.authentication;

//     final credential = GoogleAuthProvider.credential(
//         accessToken: gAuth.accessToken, idToken: gAuth.idToken);

//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
// }

// class VerifyEmailUser {
//   verifyEmailUser() async {
//     var emailAuth = 'someemail@domain.com';
//     return await FirebaseAuth.instance.sendSignInLinkToEmail(
//         email: emailAuth, actionCodeSettings: acs)
//     .catchError((onError) => print('Error sending email verification $onError'))
//     .then((value) => print('Successfully sent email verification'));
// });
//   }
// }
