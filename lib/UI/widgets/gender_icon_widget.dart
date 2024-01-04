import 'package:flutter/material.dart';
import 'package:projects/config/size_config.dart';
import 'package:projects/constants/constants.dart';

class GenderIconWidget extends StatelessWidget {
  GenderIconWidget({
    required this.genderIcon,
    required this.genderValue,
  });
  final IconData genderIcon;
  final String genderValue;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        genderIcon,
        size: SizeConfig.height20(context) * 4,
      ),
      SizedBox(
        height: SizeConfig.height15(context),
      ),
      Text(
        "$genderValue",
        style: kLabelTextStyle,
      ),
    ]);
  }
}
