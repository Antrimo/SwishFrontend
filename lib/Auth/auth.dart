import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _fireAuth = FirebaseAuth.instance;

  User? get currentUser => _fireAuth.currentUser;

  Stream<User?> get authStateChanges => _fireAuth.authStateChanges();

  Future<void> signTFOut() async {
    await _fireAuth.signOut();
  }

  Future<UserCredential?> loginwithGoogle() async {
    try {
      final googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return null;
      }
      final googleAuth = await googleUser.authentication; 
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      return await _fireAuth.signInWithCredential(credential);
    }catch (e) {
      print(e);
      return null;
    }
  }
}