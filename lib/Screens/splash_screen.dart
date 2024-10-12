import 'package:flutter/material.dart';
import 'package:swish/Theme/color.dart';

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

            SizedBox(
              height: 100,
              width: 250, 
              child: Stack(
                children: [
                  Positioned(
                    left: 10,
                    top: 20,
                    child: Container(
                      height: 58,
                      width: 218,
                      color: Colors.black,
                    ),
                  ),
                  Positioned(
                    left: 15,   
                    top: 15,   
                    child: Container(
                      height: 58,
                      width: 218,
                      color: Colors.black,
                    ),
                  ),
                  
                  Positioned(
                    left: 20, 
                    top: 10,  
                    child: Container(
                      height: 58,
                      width: 218,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                      child: const Center(
                        child: Text(
                          "Let's Get Started",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
