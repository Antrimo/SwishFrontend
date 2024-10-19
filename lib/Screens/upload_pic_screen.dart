import 'package:flutter/material.dart';
import 'package:swish/Components/Blocks/picture_block.dart';
import 'package:swish/Components/Blocks/stack_block.dart';
import 'package:swish/Screens/gender_screen.dart';
import 'package:swish/Theme/color.dart';

class UploadPicScreen extends StatelessWidget {
  const UploadPicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Text(
              'Give us your best shots!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 297,
              width: 298,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: splashScreen,
                  width: 2,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: StackBlock(
                title: 'What should we call you?',
                screen: const UploadPicScreen(),
                blockColor: splashScreen,
                textColor: Colors.white, isAuth: false,
                height: 58, width: 280, isFunction: false, isWidth: false,
              ),
            ),
            
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Add 2 more shots!'),
                SizedBox(width: 5),
                Icon(Icons.camera_enhance),
              ],
            ),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PictureBlock(blockColor: Colors.white, textColor: splashScreen, height: 154, width: 119, icon: const Icon(Icons.add_a_photo),),
                PictureBlock(blockColor: Colors.white, textColor: splashScreen, height: 154, width: 119,icon: const Icon(Icons.add_a_photo),),
              ],
            ),
        
            StackBlock(
                title: 'Continue',
                screen: const GenderScreen(),
                blockColor: splashScreen,
                textColor: Colors.white, isAuth: false,
                height: 58, width: 280, isFunction: false, isWidth: false,
              ),
          ],
        ),
      ),
    );
  }
}