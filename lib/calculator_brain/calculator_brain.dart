class CalculatorBrain {
  final int height;
  final int weight;
  double _bmi = 0;

  CalculatorBrain({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / (height * height) * 10000;
    return _bmi.toStringAsFixed(1);
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try ot exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }
}
