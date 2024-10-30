import 'package:flutter/material.dart';
import 'package:swish/API/api_basicdetails.dart';
import 'package:swish/Components/Blocks/dob_block.dart';
import 'package:swish/Components/Blocks/slider_block.dart';
import 'package:swish/Components/Blocks/stack_block.dart';
import 'package:swish/Screens/find_me_date_screen.dart';
import 'package:swish/Theme/color.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  _BirthdayScreenState createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  // Controllers to capture DOB inputs
  final TextEditingController dayController = TextEditingController();
  final TextEditingController monthController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  double height = 170;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          const SizedBox(height: 20),
          Center(
            child: Text(
              'When’s your \nBirthday?',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 36,
                color: splashScreen,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Capture day, month, and year inputs
              DOBBlock(
                  blockColor: dob,
                  textColor: dobText,
                  digit: 'DD',
                  height: 58,
                  width: 68,
                  controller: dayController),
              DOBBlock(
                  blockColor: dob,
                  textColor: dobText,
                  digit: 'MM',
                  height: 58,
                  width: 68,
                  controller: monthController),
              DOBBlock(
                  blockColor: dob,
                  textColor: dobText,
                  digit: 'YYYY',
                  height: 58,
                  width: 92,
                  controller: yearController),
            ],
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
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.lock,
                size: 30,
              ),
              SizedBox(width: 4),
              Text(
                'We only show your age to potential matches, \nnot your birthday.',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          StackBlock(
            title: 'Done',
            screen: const FindMeDateScreen(),
            blockColor: splashScreen,
            textColor: Colors.white,
            isAuth: false,
            height: 58,
            width: 280,
            isFunction: true,
            isWidth: false,
          ),
          ElevatedButton(
            onPressed: () {
              String day =
                  dayController.text.isNotEmpty ? dayController.text : "01";
              String month =
                  monthController.text.isNotEmpty ? monthController.text : "01";
              String year =
                  yearController.text.isNotEmpty ? yearController.text : "2000";
              String birthDate = "$year-$month-$day";
              ApiBasicdetails().sendData("Unknown", "Unknown", birthDate,
                  height.toInt()); // Replace with actual height value
            },
            child: const Text('Send Data'),
          ),
        ]),
      ),
    );
  }
}
