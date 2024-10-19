import 'package:flutter/material.dart';
import 'package:swish/Components/Blocks/gender_block.dart';
import 'package:swish/Components/Blocks/stack_block.dart';
import 'package:swish/Screens/interested_screen.dart';
import 'package:swish/Theme/color.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: <Widget>[
          const SizedBox(height: 20),
          Center(
            child: Text(
              'How would you \ndescribe yourself?',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 36,
                color: splashScreen,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          GenderBlock(
            title: 'Men',
            isSelected: selectedGender == 'Men',
            onTap: () {
              setState(() {
                selectedGender = 'Men';
              });
            },
          ),
          const SizedBox(height: 20),
          GenderBlock(
            title: 'Women',
            isSelected: selectedGender == 'Women',
            onTap: () {
              setState(() {
                selectedGender = 'Women';
              });
            },
          ),
          const SizedBox(height: 20),
          GenderBlock(
            title: 'Non-Binary',
            isSelected: selectedGender == 'Non-Binary',
            onTap: () {
              setState(() {
                selectedGender = 'Non-Binary';
              });
            },
          ),
          const SizedBox(height: 20),
          StackBlock(title: 'Done', screen: const InterestedScreen(), blockColor: splashScreen, textColor: Colors.white, isAuth: false, height: 58, width: 280, isFunction: false, isWidth: false,)
        ],
      ),
    );
  }
}
