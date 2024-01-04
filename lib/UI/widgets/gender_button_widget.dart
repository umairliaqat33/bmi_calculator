import 'package:flutter/material.dart';
import 'package:projects/UI/widgets/gender_icon_widget.dart';
import 'package:projects/UI/widgets/reusable_card_widget.dart';
import 'package:projects/Utils/enums.dart';

class GenderButtonWidget extends StatelessWidget {
  const GenderButtonWidget({
    Key? key,
    required this.selectedGender,
    required this.genderIcon,
    required this.color,
    required this.genderName,
  }) : super(key: key);
  final Gender selectedGender;
  final IconData genderIcon;
  final Color color;
  final String genderName;

  @override
  Widget build(BuildContext context) {
    return ReusableCardWidget(
      colour: color,
      cardChild: GenderIconWidget(
        genderIcon: genderIcon,
        genderValue: genderName,
      ),
    );
  }
}
