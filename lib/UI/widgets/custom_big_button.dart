import 'package:flutter/material.dart';
import 'package:projects/config/size_config.dart';
import 'package:projects/constants/constants.dart';

class CustomBigButton extends StatelessWidget {
  const CustomBigButton({
    Key? key,
    required this.btnText,
    required this.onTap,
  }) : super(key: key);
  final String btnText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.only(
          top: SizeConfig.height10(context),
          left: SizeConfig.width20(context),
          right: SizeConfig.width20(context),
          bottom: SizeConfig.height20(context),
        ),
        width: double.infinity,
        height: SizeConfig.height20(context) * 2.5,
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Center(
          child: Text(
            'RE-CALCULATE',
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
