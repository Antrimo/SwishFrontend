import 'package:flutter/material.dart';
import 'package:swish/Components/Blocks/code_block.dart';
import 'package:swish/Components/Blocks/stack_block.dart';
import 'package:swish/Screens/upload_pic_screen.dart';
import 'package:swish/Theme/color.dart';

class EnterCodeScreen extends StatelessWidget {
  const EnterCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body:  Padding(
        padding: const EdgeInsets.only(left: 15.0,top: 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(left: 16), 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Enter Your\nCode',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Enter the 4-digit Code we have sent to you \nat +91 000 000 0000',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                CodeBlock(blockColor: splashScreen, textColor: Colors.white, digit: '8',),
                CodeBlock(blockColor: splashScreen, textColor: Colors.white, digit: '8',),
                CodeBlock(blockColor: splashScreen, textColor: Colors.white, digit: '8',),
                CodeBlock(blockColor: splashScreen, textColor: Colors.white, digit: '8',),
              ],
            ),
            const SizedBox(height: 20),
            Center(child: StackBlock(title: 'Continue', screen: const UploadPicScreen(), blockColor: splashScreen, textColor: Colors.white)),
            
          ],
        ),
      ),
    );
  }
}
