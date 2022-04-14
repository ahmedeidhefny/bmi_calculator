import 'package:bmi_calculator/components/main_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  final bmiResult, resultText, interpretations;


  ResultPage({required this.bmiResult, required this.resultText, required this.interpretations});

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              child: Text(
                'YOUR RESULTS',
                style: KTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kInActiveCardColor,
              onPress: (){},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultText, style: KResultTextStyle,),
                  Text(bmiResult, style: KBMITextStyle,),
                  Text(interpretations, style: KBodyTextStyle,
                  textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          MainButton(btnText: 'RE-CALCULATE', onTab: (){
            Navigator.pop(context);
          })
        ],
      ),
    );
  }
}
