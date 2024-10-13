import 'package:flutter/material.dart';
import 'package:swish/Theme/color.dart';

class NumpadBlock extends StatelessWidget {
  final String phoneNumber;
  final String countryCode;
  final Color blockColor;
  final Color textColor;

  const NumpadBlock({super.key, required this.blockColor, required this.textColor, required this.phoneNumber, required this.countryCode});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 100, 
          width: 90,   
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 20,
                child: Container(
                  height: 58,
                  width: 68,
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: 15,
                top: 15,
                child: Container(
                  height: 58,
                  width: 68,
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: 20,
                top: 10,
                child: Container(
                  height: 58,
                  width: 68,
                  decoration: BoxDecoration(
                    color: blockColor,
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      countryCode,
                      style: TextStyle(fontSize: 16, color: textColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          width: 230,
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 20,
                child: Container(
                  height: 58,
                  width: 200,
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: 15,
                top: 15,
                child: Container(
                  height: 58,
                  width: 200,
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: 20,
                top: 10,
                child: Container(
                  height: 58,
                  width: 200,
                  decoration: BoxDecoration(
                    color: blockColor,
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: TextEditingController(),
                        decoration: InputDecoration(     
                          border: InputBorder.none,
                          hintText: '000000000', 
                          hintStyle: TextStyle(fontSize: 16, color: splashScreen),
                        ),
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
