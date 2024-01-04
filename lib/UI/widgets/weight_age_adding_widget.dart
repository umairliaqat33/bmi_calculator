import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projects/UI/screens/input_page.dart';
import 'package:projects/UI/widgets/reusable_card_widget.dart';
import 'package:projects/config/size_config.dart';
import 'package:projects/constants/constants.dart';

class WeightAgeAddingWidget extends StatelessWidget {
  const WeightAgeAddingWidget({
    Key? key,
    required this.addButton,
    required this.subtractButton,
    required this.title,
    required this.value,
  }) : super(key: key);
  final Function addButton;
  final Function subtractButton;
  final String title;
  final int value;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ReusableCardWidget(
        colour: kActiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: kLabelTextStyle,
            ),
            Text(
              value.toString(),
              style: kNumberedText,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  FontAwesomeIcons.plus,
                  addButton,
                ),
                SizedBox(
                  width: SizeConfig.width10(context),
                ),
                RoundIconButton(
                  FontAwesomeIcons.minus,
                  subtractButton,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
