import 'package:flutter/material.dart';
import 'package:swish/Components/Blocks/slider_block.dart';
import 'package:swish/Theme/color.dart';

class BirthdayScreen extends StatelessWidget {
  const BirthdayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Who are you \ninterested in?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 36,
                  color: splashScreen,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                'What’s your \nheight?',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 36,
                  color: splashScreen,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SliderBlock(),
            ]
      ),
    );
  }
}