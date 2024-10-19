import 'package:flutter/material.dart';
import 'package:swish/Components/Blocks/numpad_block.dart';
import 'package:swish/Components/Blocks/stack_block.dart';
import 'package:swish/Screens/enter_code_screen.dart';
import 'package:swish/Theme/color.dart';

class NumpadScreen extends StatelessWidget {
  const NumpadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 40, top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 15), // Shift text to the right
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What\'s your \nnumber?',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Please enter your valid phone number.\nWe will send you 4 digit code to verify your\naccount',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            NumpadBlock(
              blockColor: Colors.white,
              textColor: splashScreen,
              phoneNumber: '6307195977',
              countryCode: '+91',
            ),
            const SizedBox(height: 20),
            
            Center(child: StackBlock(title: 'Continue', screen: const EnterCodeScreen(), blockColor: splashScreen, textColor: Colors.white, isAuth: false, height: 58, width: 218, isFunction: false, isWidth: false,)),
          ],
        ),
      ),
    );
  }
}
