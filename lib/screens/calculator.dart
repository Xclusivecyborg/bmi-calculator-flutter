import 'dart:math';

class Calculator {
  final int weight;
  final int height;
  double bmi;

  Calculator({this.weight, this.height});

  String bmiCalculator() {
    bmi = weight / pow(height / 100, 2);
    return bmi.toStringAsFixed(1);
  }

  String result() {
    if (bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (bmi >= 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String interpretation() {
    if (bmi >= 25) {
      return "You're overweight, Stop eating like a thief in the Night!";
    } else if (bmi >= 18.5) {
      return 'You have a normal BMI. Good job!';
    } else {
      return "You're Underweight, try dey eat small small";
    }
  }
}
