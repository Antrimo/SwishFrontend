import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:swish/Screens/finding_match.dart';
import 'package:swish/Screens/interested_screen.dart';
import 'package:swish/Screens/numpad_screen.dart';
import 'package:swish/Screens/splash_screen.dart';
import 'package:swish/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  const FindingMatch(),
      ),
    );
  }
}