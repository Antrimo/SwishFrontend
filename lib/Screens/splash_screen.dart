import 'package:flutter/material.dart';
import 'package:swish/Screens/sign_in_screen.dart';
import 'package:swish/Theme/color.dart';
import 'package:swish/Components/stack_block.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: splashScreen,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 217,
              width: 252,
            ),
            const Text(
              'Stop Swiping,',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Text(
              'Start Swishing!',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const StackBlock(
              blockColor: Colors.white,
              textColor: Colors.black,
              title: "Let's Get Started",
              screen: SignInScreen()
            ),
          ],
        ),
      ),
    );
  }
}


