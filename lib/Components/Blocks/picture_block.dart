import 'package:flutter/material.dart';


class PictureBlock extends StatefulWidget {
  final double height;
  final double width;
  final Color blockColor;
  final Color textColor;
  final Icon icon;




  const PictureBlock({super.key, required this.blockColor, required this.textColor,  required this.height, required this.width, required this.icon, });

  @override
  State<PictureBlock> createState() => _PictureBlockState();
}

class _PictureBlockState extends State<PictureBlock> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
       
        
      },
      child: Center(
        child: SizedBox(
          height: 180,
          width: 150,
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 20,
                  child: Container(
                    height: widget.height,
                    width: widget.width,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 15,
                  child: Container(
                    height: widget.height,
                    width: widget.width,
                    color: Colors.black,
                  ),
                ),
                Positioned(
                  left: 20,
                  top: 10,
                  child: Container(
                    height: widget.height,
                    width: widget.width,
                    decoration: BoxDecoration(
                      color: widget.blockColor,
                      border: Border.all(width: 2, color: Colors.black),
                    ),
                    child: widget.icon, 
                    
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
