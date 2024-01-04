import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projects/UI/screens/result_page.dart';
import 'package:projects/UI/widgets/custom_big_button.dart';
import 'package:projects/UI/widgets/gender_button_widget.dart';
import 'package:projects/UI/widgets/reusable_card_widget.dart';
import 'package:projects/UI/widgets/weight_age_adding_widget.dart';
import 'package:projects/Utils/enums.dart';
import 'package:projects/calculator_brain/calculator_brain.dart';
import 'package:projects/constants/constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        log('Male button was pressed');
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      child: GenderButtonWidget(
                        selectedGender: selectedGender,
                        genderIcon: FontAwesomeIcons.male,
                        color: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        genderName: Gender.male.name,
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = Gender.female;
                        });
                        log('FeMale button was pressed');
                      },
                      child: GenderButtonWidget(
                        selectedGender: selectedGender,
                        genderIcon: FontAwesomeIcons.female,
                        color: selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        genderName: Gender.female.name,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCardWidget(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '$height',
                            style: kNumberedText,
                          ),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          inactiveTrackColor: Color(0xFF8D8E98),
                        ),
                        child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });

                            log(height.toString());
                          },
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
              child: Row(
                children: [
                  WeightAgeAddingWidget(
                    addButton: () => _addWeight(),
                    subtractButton: () => _subtractWeight(),
                    title: "WEIGHT",
                    value: weight,
                  ),
                  WeightAgeAddingWidget(
                    addButton: () => _addAge(),
                    subtractButton: () => _subtractAge(),
                    title: "AGE",
                    value: age,
                  ),
                ],
              ),
            ),
            CustomBigButton(
              btnText: "CALCULATE",
              onTap: () => _calculateBMI(),
            ),
          ],
        ),
      ),
    );
  }

  void _addWeight() {
    setState(() {
      weight += 1;
    });
  }

  void _subtractWeight() {
    setState(() {
      weight -= 1;
    });
  }

  void _addAge() {
    setState(() {
      age += 1;
    });
  }

  void _subtractAge() {
    setState(() {
      age -= 1;
    });
  }

  void _calculateBMI() {
    CalculatorBrain calc = CalculatorBrain(
      height: height,
      weight: weight,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultsPage(
          bmi: calc.calculateBMI(),
          result: calc.getResult(),
          interpretation: calc.getInterpretation(),
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton(this.icon, this.calculation);
  final IconData icon;
  final Function calculation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        calculation();
      },
      child: Icon(icon),
      shape: CircleBorder(),
      elevation: 6,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
    );
  }
}
