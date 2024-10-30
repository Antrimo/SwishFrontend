import 'dart:async';
import 'package:flutter/material.dart';
import 'package:swish/Screens/match_screen.dart';
import 'package:swish/Theme/color.dart';

class FindingMatch extends StatefulWidget {
  const FindingMatch({super.key});

  @override
  State<FindingMatch> createState() => _FindingMatchState();
}

class _FindingMatchState extends State<FindingMatch> {
  bool isMatchFound = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startMatchFinding();
  }

  void startMatchFinding() {
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {

        isMatchFound = checkForMatch();
      });
      
      if (isMatchFound) {
        _timer.cancel(); 
        navigateToMatchScreen();
      }
    });
  }

  bool checkForMatch() {

    return DateTime.now().second % 10 == 0; 
  }

  void navigateToMatchScreen() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => const MatchScreen()));
    
  }

  @override
  void dispose() {
    _timer.cancel(); 
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashScreen,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _timer.cancel();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MatchScreen()));
              },
              child: Image.asset(
                'assets/images/logo.png',
                height: 217,
                width: 252,
              ),
            ),
             CircularProgressIndicator(color: primaryColor,),
            const SizedBox(height: 220),
            const Text(
              'Finding you a match',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
