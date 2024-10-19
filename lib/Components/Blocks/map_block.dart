import 'package:flutter/material.dart';

class MapBlock extends StatelessWidget {
  final Color blockColor;
  final double height;
  final double width;

  const MapBlock({
    super.key, 
    required this.blockColor, 
    required this.height,
    required this.width,
   
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
      child: SizedBox(
        height: 500,
        width: 325,
        child: Center(
          child: Stack(
            children: [
              Positioned(
                left: 13,
                top: 19,
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
                 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
