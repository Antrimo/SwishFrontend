
import 'package:flutter/material.dart';
import 'package:swish/Components/Blocks/interest_block.dart';
import 'package:swish/Components/Blocks/stack_block.dart';
import 'package:swish/Screens/birthday_screen.dart';
import 'package:swish/Theme/color.dart';

class InterestedScreen extends StatefulWidget {
  const InterestedScreen({super.key});

  @override
  State<InterestedScreen> createState() => _InterestedScreenState();
}

class _InterestedScreenState extends State<InterestedScreen> {

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
          InterestBlock(
            title: 'Men',
            isSelected: selectedGender == 'Men',
            onTap: () {
              setState(() {
                selectedGender = 'Men';
              });
            },
          ),
          const SizedBox(height: 20),
          InterestBlock(
            title: 'Women',
            isSelected: selectedGender == 'Women',
            onTap: () {
              setState(() {
                selectedGender = 'Women';
              });
            },
          ),
          const SizedBox(height: 20),
          InterestBlock(
            title: 'Everyone',
            isSelected: selectedGender == 'Everyone',
            onTap: () {
              setState(() {
                selectedGender = 'Everyone';
              });
            },
          ),
          const SizedBox(height: 20),
          StackBlock(title: 'Done', screen: const BirthdayScreen(), blockColor: splashScreen, textColor: Colors.white, isAuth: false, height: 58, width: 280)
        ],
      ),
    );
  }
}