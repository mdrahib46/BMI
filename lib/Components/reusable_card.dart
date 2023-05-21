import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  ReUsableCard({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;

  // callback function assigned in another function
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          // color: Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onTap: onPress,
    );
  }
}



