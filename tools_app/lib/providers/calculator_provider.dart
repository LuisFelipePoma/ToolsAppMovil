import 'dart:collection';

import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  GlobalKey viewKey = GlobalKey();

  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);

  String prompt = '0';
  String previousPrompt = '0';
  String result = '';
  String previousResult = '';
  bool isOpenParan = false;

  setCurrentPage(int value) {
    currentPage = value;
    notifyListeners();
  }

  setPrompt(String value) {
    if (prompt == '0') prompt = '';
    if (value == '(') isOpenParan = true;
    if (value == ')') isOpenParan = false;
    prompt = '$prompt $value';
    notifyListeners();
  }

  clearPrompt() {
    prompt = '0';
    notifyListeners();
  }

  erasePrompt() {
    if (prompt == '0') return;
    prompt = prompt.substring(0, prompt.length - 2);
    if (prompt.isEmpty) prompt = '0';
    notifyListeners();
  }

  calculatePrompt() {
    String expresion = prompt;

    // Eliminamos espacios en blanco de la expresión
    expresion = expresion.replaceAll(' ', '');
    expresion = expresion.replaceAll('x', '*');
    // Llamamos a la función auxiliar para evaluar la expresión
    previousResult = resolverExpresionMatematica(expresion).toString();
		previousPrompt = expresion;
    result = previousResult;
    prompt = result.toString();
    notifyListeners();
  }

  double resolverExpresionMatematica(String expresion) {
    Queue<String> operadores = Queue();
    Queue<double> operandos = Queue();

    expresion = expresion.replaceAll(' ', '');

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

  bool esOperador(String c) {
    return c == '+' || c == '-' || c == '*' || c == '/' || c == '%';
  }

  bool tienePrecedencia(String op1, String op2) {
    if (op1 == '(' || op1 == ')') {
      return false;
    }
    if ((op1 == '*' || op1 == '/' || op1 == '%') &&
        (op2 == '+' || op2 == '-')) {
      return false;
    }
    return true;
  }

  void calcular(String operador, Queue<double> operandos) {
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
