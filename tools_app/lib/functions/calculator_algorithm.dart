import 'dart:collection';

class CalculatorAlgorithm {
  static double resolverExpresionMatematica(String expresion) {
    Queue<String> operadores = Queue();
    Queue<double> operandos = Queue();

    expresion = expresion.replaceAll(' ', '');
    expresion = expresion.replaceAll('x', '*');

    int i = 0;
    while (i < expresion.length) {
      if (expresion[i] == '(') {
        operadores.add(expresion[i]);
        i++;
      } else if (expresion[i] == ')') {
        while (operadores.isNotEmpty && operadores.last != '(') {
          calcular(operadores.removeLast(), operandos);
        }
        if (operadores.isNotEmpty && operadores.last == '(') {
          operadores.removeLast();
        }
        i++;
      } else if (esOperador(expresion[i])) {
        while (operadores.isNotEmpty &&
            tienePrecedencia(operadores.last, expresion[i])) {
          calcular(operadores.removeLast(), operandos);
        }
        operadores.add(expresion[i]);
        i++;
      } else {
        String numero = '';
        while (i < expresion.length &&
            !esOperador(expresion[i]) &&
            expresion[i] != '(' &&
            expresion[i] != ')') {
          numero += expresion[i];
          i++;
        }
        operandos.add(double.parse(numero));
      }
    }

    while (operadores.isNotEmpty) {
      calcular(operadores.removeLast(), operandos);
    }

    return operandos.single;
  }

  static bool esOperador(String c) {
    return c == '+' || c == '-' || c == '*' || c == '/' || c == '%';
  }

  static bool tienePrecedencia(String op1, String op2) {
    if (op1 == '(' || op1 == ')') {
      return false;
    }
    if ((op1 == '*' || op1 == '/' || op1 == '%') &&
        (op2 == '+' || op2 == '-')) {
      return false;
    }
    return true;
  }

  static void calcular(String operador, Queue<double> operandos) {
    double num2 = operandos.removeLast();
    double num1 = operandos.removeLast();
    double resultado = 0;

    switch (operador) {
      case '+':
        resultado = num1 + num2;
        break;
      case '-':
        resultado = num1 - num2;
        break;
      case '*':
        resultado = num1 * num2;
        break;
      case '/':
        resultado = num1 / num2;
        break;
      case '%':
        resultado = num1 % num2;
        break;
    }

    operandos.add(resultado);
  }
}
