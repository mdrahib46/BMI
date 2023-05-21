import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.buttonTitle});

  final VoidCallback? onTap;
  final String? buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            buttonTitle!,
            style: kLeargeButtonTextStyel,
          ),
        ),
        height: kBottomTabHeight,
        width: double.infinity,
        color: kBottomTabColor,
      ),
    );
  }
}
