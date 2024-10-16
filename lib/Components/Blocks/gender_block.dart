import 'package:flutter/material.dart';
import 'package:swish/Theme/color.dart';

class GenderBlock extends StatelessWidget {
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderBlock({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 100,
        width: 300,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                left: 10,
                top: 20,
                child: Container(
                  height: 58,
                  width: 280,
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: 15,
                top: 15,
                child: Container(
                  height: 58,
                  width: 280,
                  color: Colors.black,
                ),
              ),
              Positioned(
                left: 20,
                top: 10,
                child: Container(
                  height: 58,
                  width: 280,
                  decoration: BoxDecoration(
                    color: isSelected ? splashScreen : Colors.white, 
                    border: Border.all(width: 2, color: Colors.black),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      style:  TextStyle(
                        fontSize: 16,
                        color: isSelected ?Colors.white : splashScreen,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
