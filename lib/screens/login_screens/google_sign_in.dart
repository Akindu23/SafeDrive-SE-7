import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:test_six/loginPage.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();

//  bool _isSigningIn;
//
//   GoogleSignInProvider() {
//     _isSigningIn = false;
//   }
//
//   bool get isSigningIn => _isSigningIn;
//
//   set isSigningIn(bool isSigningIn) {
//     _isSigningIn = isSigningIn;
//     notifyListeners();
//   }
//
  Future googleLogin() async {
    final googleUser = await googleSignIn.signIn();
    if (googleUser == null) return;
    _user =googleUser;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }
//
//     final user = await googleSignIn.signIn();
//     if (user == null) {
//       isSigningIn = false;
//       return;
//     } else {
//       final googleAuth = await user.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       await FirebaseAuth.instance.signInWithCredential(credential);
//
//       isSigningIn = false;
//     }
//   }
//
//   void logout() async {
//     await googleSignIn.disconnect();
//     FirebaseAuth.instance.signOut();
//   }
// }
//

  GoogleSignInAccount? _user;

  GoogleSignInAccount get user => _user!;


}