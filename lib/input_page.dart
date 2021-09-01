import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconContent.dart';
import 'ReusableCard.dart';
import 'constants.dart';

enum Gender { male, female }
Gender selectedGender = Gender.male;
int height = 180;
int weight = 60;
int age=20;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  add() {
    setState(() {
      weight += 1;
    });
  }

  subtract() {
    setState(() {
      weight -= 1;
    });
  }
  adda(){
    setState(() {
      age+=1;
    });
  }
  subtracta(){
    setState(() {
      age-=1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('Male button was pressed');
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                        selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        IconContent(FontAwesomeIcons.mars, 'MALE')),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                      print('FeMale button was pressed');
                    },
                    child: ReusableCard(
                        selectedGender == Gender.female
                            ? kActiveCardColor
                            : kInActiveCardColor,
                        IconContent(FontAwesomeIcons.female, 'FEMALE')),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                kActiveCardColor,
                Column(
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
                          '$height', //or we can add this variable as height.toString() without commas       if we just write it without .toString it will give us the error.
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

                          print(height);
                        },
                      ),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    kActiveCardColor,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          '$weight',
                          style: kNumberedText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(FontAwesomeIcons.plus, add),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              FontAwesomeIcons.minus,
                              subtract,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(child: ReusableCard(kActiveCardColor, Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('AGE',style: kLabelTextStyle,),
                    Text('$age',style: kNumberedText,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [RoundIconButton(FontAwesomeIcons.minus, subtracta),
                      SizedBox(width: 10,),
                      RoundIconButton(FontAwesomeIcons.plus, adda),
                      ],
                    )
                  ],
                )))
              ],
            ),
          ),
          Container(
            color: kActiveBottomColor,
            width: double.infinity,
            margin: EdgeInsets.only(top: 10),
            height: kBottomContainerHeight,
          ),
        ],
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
