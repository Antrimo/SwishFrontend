import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class FirebaseHome extends StatefulWidget {
  const FirebaseHome({super.key});

  @override
  State<FirebaseHome> createState() => _FirebaseHomeState();
}

class _FirebaseHomeState extends State<FirebaseHome> {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  @override
  void initState() {
    super.initState();
    // Listen for auth state changes
    _auth.authStateChanges().listen((User? user) {
      setState(() {
        _user = user;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Auth Example"),
      ),
      body: const Center(
        
      ),
    );
  }


}
