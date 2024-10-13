import 'package:flutter/material.dart';

class SocialMediaBlock extends StatelessWidget {
  final Icon icon;
  final Widget screen;
  final Color blockColor;
  final Color iconColor;

  const SocialMediaBlock({
    super.key, 
    required this.icon, 
    required this.screen, 
    required this.blockColor, 
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
      },
      child: SizedBox(
        height: 100,
        width: 100,
        child: Stack(
          children: [
            Positioned(
              left: 10,
              top: 20,
              child: Container(
                height: 38,
                width: 58,
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 15,
              top: 15,
              child: Container(
                height: 38,
                width: 58,
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 20,
              top: 10,
              child: Container(
                height: 38,
                width: 58,
                decoration: BoxDecoration(
                  color: blockColor,
                  border: Border.all(width: 2, color: Colors.black),
                ),
                child: Center(
                  child: icon,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
