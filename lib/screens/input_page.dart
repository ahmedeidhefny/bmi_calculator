import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/icon_gender_content.dart';
import '../components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import 'result_page.dart';
import '../components/rounded_icon_button.dart';
import '../components/main_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderType = Gender.MALE;
  double height = 180.0;
  int weight = 60, age = 20;

  // Color maleCardColor = inActiveCardColor;
  // Color femaleCardColor = inActiveCardColor;
  //
  // void updateCardColor(Gender gender) {
  //   //male card pressed
  //   if (gender == Gender.MALE) {
  //     if (maleCardColor == inActiveCardColor) {
  //       maleCardColor == activeCardColor;
  //       femaleCardColor == inActiveCardColor;
  //     } else {
  //       maleCardColor == inActiveCardColor;
  //     }
  //   }
  //
  //   //female card pressed
  //   if (gender == Gender.FEMALE) {
  //     if (femaleCardColor == inActiveCardColor) {
  //       femaleCardColor == activeCardColor;
  //       maleCardColor == inActiveCardColor;
  //     } else {
  //       femaleCardColor == inActiveCardColor;
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.red,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark,
          // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      genderType = Gender.MALE;
                    });
                  },
                  colour: genderType == Gender.MALE
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  cardChild: IconGenderContent(
                    icon: FontAwesomeIcons.mars,
                    text: 'Male',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      genderType = Gender.FEMALE;
                    });
                  },
                  colour: genderType == Gender.FEMALE
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  cardChild: IconGenderContent(
                    icon: FontAwesomeIcons.venus,
                    text: 'Female',
                  ),
                ),
              )
            ],
          )),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              colour: kActiveCardColor,
              cardChild: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: KLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toInt().toString(),
                          style: KNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: KLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 20.0),
                      ),
                      /*SliderThemeData(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 20.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),*/
                      child: Slider(
                        value: height.toDouble(),
                        inactiveColor: Color(0xFF8D8E98),
                        min: 120.0,
                        max: 220.0,
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.roundToDouble();
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButtom(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (weight > 0) weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButtom(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: KLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: KNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedIconButtom(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (age > 0) age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundedIconButtom(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          MainButton(
            btnText: 'CALCULATE',
            onTab: () {
              CalculatorBrain calc = CalculatorBrain(weight: weight, height: height.toInt());
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage(
                      bmiResult: calc.calculateBMi(),
                      resultText: calc.getResult() ,
                      interpretations: calc.getInterpretations(),
                    )));
              });
            },
          )
        ],
      ),
    );
  }
}



/*class ContainerColumn extends StatelessWidget {
  final String textTitle;
  final int textValue;
  final String measurement;

  ContainerColumn(
      {required this.textTitle,
      required this.textValue,
      required this.measurement});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textTitle,
            style: KLabelTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                textValue.toString(),
                style: KNumberTextStyle,
              ),
              Text(
                measurement,
                style: KLabelTextStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}*/
