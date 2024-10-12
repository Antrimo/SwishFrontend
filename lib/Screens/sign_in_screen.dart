import 'package:flutter/material.dart';
import 'package:swish/Components/dummy.dart';
import 'package:swish/Components/Blocks/social_media_block.dart';
import 'package:swish/Components/Blocks/stack_block.dart';
import 'package:swish/Screens/numpad_screen.dart';
import 'package:swish/Theme/color.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body:  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Swish', style: TextStyle(fontSize: 40, color: Colors.black, fontWeight: FontWeight.bold,fontFamily: 'Lexend Deca'),),
            const Text(
              'Sign in to continue',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            StackBlock(title: 'Continue with gmail', screen: const SignInScreen(), blockColor: splashScreen, textColor: Colors.white),
            const SizedBox(height: 20),
            StackBlock(title: 'Use Phone Number', screen: const NumpadScreen(), blockColor: Colors.white, textColor: splashScreen),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                SocialMediaBlock(icon: const Icon(Icons.home), screen: const Dummy(), blockColor: Colors.white, iconColor: splashScreen),
                const SizedBox(width: 10),
                SocialMediaBlock(icon: const Icon(Icons.home), screen: const Dummy(), blockColor: Colors.white, iconColor: splashScreen),
                const SizedBox(width: 10),
                SocialMediaBlock(icon: const Icon(Icons.home), screen: const Dummy(), blockColor: Colors.white, iconColor: splashScreen),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Terms of Service',
                  style: TextStyle(
                    fontSize: 12,
                    color: termsServices,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  'Privacy Policy',
                  style: TextStyle(
                    fontSize: 12,
                    color: termsServices,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}