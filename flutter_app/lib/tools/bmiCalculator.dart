import 'dart:math';

class BmiCalculator {
  static num calculate(num height, num weight) => weight / (pow(height, 2));
}
