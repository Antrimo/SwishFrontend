import 'package:flutter/material.dart';

class SliderBlock extends StatefulWidget {
  const SliderBlock({super.key});

  @override
  State<SliderBlock> createState() => _SliderBlockState();
}

class _SliderBlockState extends State<SliderBlock> {
  double _currentValue = 175;

  @override
  Widget build(BuildContext context) {
    return Center( 
      child: SizedBox(
        height: 40,
        width: 300,
        child: Stack(
          children: [
            Positioned(
              left: 15,
              top: 9,
              child: Container(
                height: 31,
                width: 265,
                color: Colors.black,
              ),
            ),
            Positioned(
              left: 20,
              top: 5,
              child: Container(
                height: 31,
                width: 265,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 3),
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.red,
                          inactiveTrackColor: Colors.red.withOpacity(0.4),
                          thumbColor: Colors.red,
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 10),
                            ),
                        child: Slider(
                          value: _currentValue,
                          min: 100,
                          max: 200,
                          divisions: 100,
                          onChanged: (double value) {
                            setState(() {
                              _currentValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        border: Border(
                          left: BorderSide(color: Colors.black, width: 3),
                        ),
                        color: Colors.white,
                      ),
                      child: Text(
                        '${_currentValue.toInt()} cm',
                        style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
