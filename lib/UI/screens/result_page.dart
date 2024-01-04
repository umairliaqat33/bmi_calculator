import 'package:projects/UI/widgets/custom_big_button.dart';
import 'package:projects/UI/widgets/reusable_card_widget.dart';

import 'package:flutter/material.dart';
import 'package:projects/constants/constants.dart';

class ResultsPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;

  const ResultsPage({
    required this.bmi,
    required this.result,
    required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('BMI CALCULATOR'),
            centerTitle: true,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Container(
                      child: Center(
                child: Text(
                  'Your Result',
                  style: kTitleTextStyle,
                ),
              ))),
              Expanded(
                  flex: 5,
                  child: ReusableCardWidget(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          result.toUpperCase(),
                          style: kResultTextStyle,
                        ),
                        Text(
                          bmi,
                          style: kBMITextStyle,
                        ),
                        Text(
                          interpretation,
                          textAlign: TextAlign.center,
                          style: kBodyTextStyle,
                        )
                      ],
                    ),
                  )),
              CustomBigButton(
                btnText: "RE-CALCULATE",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          )),
    );
  }
}
