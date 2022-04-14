import 'dart:math';
class CalculatorBrain{
  final int  weight, height;
  CalculatorBrain({required this.weight, required this.height});

  double _bmi = 0.0;

  String calculateBMi(){
    _bmi = weight / (pow((height/100), 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi >= 25){
      return 'OVER_WEIGHT';
    }else if (_bmi > 18.5) {
      return 'NORMAL';
    }else{
      return 'UNDER_WEIGHT';
    }
  }

  String getInterpretations(){
    if (_bmi >= 25){
      return 'Defines the configuration of the overall visual';
    }else if (_bmi > 18.5) {
      return 'The MaterialApp theme property can be used';
    }else{
      return 'The static Theme.of method finds the ThemeData ';
    }
  }



}