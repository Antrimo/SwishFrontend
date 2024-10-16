import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:swish/Components/dummy.dart';
import 'package:swish/Components/Blocks/social_media_block.dart';
import 'package:swish/Components/Blocks/stack_block.dart';
import 'package:swish/Screens/numpad_screen.dart';
import 'package:swish/Screens/upload_pic_screen.dart';
import 'package:swish/Theme/color.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final googleSignProvider = GoogleSignIn();

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
            StackBlock(title: 'Continue with gmail', screen: const UploadPicScreen(), blockColor: splashScreen, textColor: Colors.white, isAuth: true, height: 58, width: 218,),
            
            const SizedBox(height: 20),
            StackBlock(title: 'Use Phone Number', screen: const NumpadScreen(), blockColor: Colors.white, textColor: splashScreen, isAuth: false, height: 58, width: 218,),
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