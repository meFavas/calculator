import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorController extends GetxController {
  var display = ''.obs;
  var result = ''.obs;

  void input(String value) {
    if (value == 'C') {
      display.value = '';
      result.value = '';
    } else if (value == '=') {
      try {
        result.value = _calculate(display.value);
      } catch (e) {
        result.value = 'Error';
      }
    } else {
      display.value += value;
    }
  }

  String _calculate(String expression) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      return eval.toString();
    } catch (e) {
      return 'Error';
    }
  }

}
