import 'dart:async';
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

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
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String? idToken = await user.getIdToken(true);
        print("Firebase ID Token: $idToken");
        await sendTokenToBackend(idToken!);
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




  Future<void> sendTokenToBackend(String token) async {
  final response = await http.post(
    Uri.parse('https://limitless-sea-53782-1344bc525592.herokuapp.com/auth/verifyToken'),
    headers: <String, String>{
      'Content-Type': 'application/json', 
    },
    body: jsonEncode(<String, String>{ 
      'idToken': token,
    }),
  );
  if (response.statusCode == 200) {
    print("Token successfully sent to backend.");
  } else {
    print("Failed to send token. Error: ${response.body}");
  }
}

}