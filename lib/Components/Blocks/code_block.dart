import 'package:flutter/material.dart';

class CodeBlock extends StatelessWidget {
  final String digit;
  final Color blockColor;
  final Color textColor;

  const CodeBlock({super.key, required this.blockColor, required this.textColor, required this.digit,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  digit,
                  style: TextStyle(fontSize: 36, color: textColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
