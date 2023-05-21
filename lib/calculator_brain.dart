
import 'dart:math';

class CalcuatorBrain{
  CalcuatorBrain({this.height, this.weight});

  final int? height;
  final int? weight;

  double? _bmi;

  String calculateBMI(){
    _bmi = weight!/ pow(height!/100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult(){
    if (_bmi! >= 25) {
      return 'Overweight !';
    }
    else if (_bmi! > 18.5){
      return 'Normal !';
    }
    else{
      return 'Underweight !';
    }
  }

  String getInterputation(){
    if (_bmi! >= 25) {
      return 'You have  higher then normal body weight. Try excersize more.';
    }
    else if (_bmi! > 18.5){
      return 'You have a normal weight. Good job.';
    }
    else{
      return 'You have lower then normal body weight. you can eat more!';
    }
  }
}