import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  IconContent(this.gender,this.gValue);
  final IconData gender;
  final String gValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          gender,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "$gValue",
          style: kLabelTextStyle,
          ),
        ]
    );

  }
}