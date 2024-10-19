import 'package:flutter/material.dart';

class DOBBlock extends StatelessWidget {
  final String digit;
  final Color blockColor;
  final Color textColor;
  final double height;
  final double width;
  final TextEditingController controller; // Added controller

  const DOBBlock({
    super.key, 
    required this.blockColor, 
    required this.textColor, 
    required this.digit, 
    required this.height, 
    required this.width,
    required this.controller, // Added controller
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100, 
      width: 120,   
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
                child: TextField(
                  controller: controller, // Set the controller
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: digit,  
                    hintStyle: TextStyle(
                      fontSize: 24, 
                      color: textColor, 
                      fontWeight: FontWeight.w900,
                    ),
                    border: InputBorder.none,  
                  ),
                  style: TextStyle(
                    fontSize: 24, 
                    color: textColor, 
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,  
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
