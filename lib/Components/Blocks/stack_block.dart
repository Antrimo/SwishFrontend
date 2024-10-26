import 'package:flutter/material.dart';
import 'package:swish/API/api_basicdetails.dart';
import 'package:swish/Auth/auth.dart';

class StackBlock extends StatelessWidget {
  final String title;
  final Widget screen;
  final double height;
  final double width;
  final Color blockColor;
  final Color textColor;
  final bool isAuth;
  final bool isFunction;
  final bool isWidth;

  final String gender;
  final String preferredGender;
  final String birthDate;
  final int heightValue;

  const StackBlock({
    super.key,
    required this.title,
    required this.screen,
    required this.blockColor,
    required this.textColor,
    required this.isAuth,
    required this.height,
    required this.width,
    required this.isFunction,
    required this.isWidth,
    this.gender = "Unknown",
    this.preferredGender = "Unknown",
    this.birthDate = "00-00-0000",
    this.heightValue = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (isAuth) {
          final user = await Auth().loginwithGoogle();
          if (user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => screen));
          }
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        }
        isFunction
            ? Api().sendData(gender, preferredGender, birthDate, heightValue)
            : null;
      },
      child: Center(
        child: SizedBox(
          height: 100,
          width: isWidth ? 250 : 300,
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 20,
                  child: Container(
                    height: height,
                    width: width,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 15,
                  child: Container(
                    height: height,
                    width: width,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 10,
                  child: Container(
                    height: height,
                    width: width,
                    decoration: BoxDecoration(
                      color: blockColor,
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
