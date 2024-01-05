import 'package:flutter/material.dart';
import 'package:projects/config/size_config.dart';

class ReusableCardWidget extends StatelessWidget {
  ReusableCardWidget({
    required this.colour,
    required this.cardChild,
  });
  final Color colour;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardChild,
      width: double.infinity,
      margin: EdgeInsets.all(SizeConfig.height15(context)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
    );
  }
}
