import 'package:flutter/material.dart';
import 'package:tools_app/functions/functions.dart';

class CalculatorProvider extends ChangeNotifier {
  // Llaves y controladores de estado
  GlobalKey viewKey = GlobalKey();
  PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;

  // Variables globales
  String prompt = '0';
  String previousPrompt = '0';
  String result = '';
  String previousResult = '';

  //Variables para manejar las excepciones
  bool isOpenParan = false;
  bool isOnDecimals = false;
  bool isOnResult = false;
  bool isOnSign = false;

  void setCurrentPage(int value) {
    currentPage = value;
    notifyListeners();
  }

  void _validateValue(value) {
    Map<String, Function()?> buttonsAsociated = {
      '(': () {
        isOpenParan = true;
      },
      ')': () {
        isOpenParan = false;
      },
      '.': () {
        isOnDecimals = true;
      }
    };
    if (buttonsAsociated[value] != null) buttonsAsociated[value]!();
  }

  void setPrompt(String value) {
    if (prompt == '0') prompt = '';
    _validateValue(value);
    int? valorInt = int.tryParse(value);
    if (valorInt != null) {
      if (isOnResult) {
        prompt = '';
        isOnResult = false;
      }
      isOnSign = false;
      prompt = '$prompt$value';
    } else {
      if (value != '.') isOnDecimals = false;
      if (value == '.' && isOnSign) {
        prompt = '$prompt 0$value';
        isOnSign = false;
      } else {
        isOnResult = false;
        isOnSign = true;
        if (value == '.') {
          prompt = '$prompt$value';
        } else {
          prompt = '$prompt $value ';
        }
      }
    }
    notifyListeners();
  }

  clearPrompt() {
    prompt = '0';
    isOnSign = true;
    isOnDecimals = false;
    notifyListeners();
  }

  erasePrompt() {
    if (prompt == '0') return;
    if (prompt[prompt.length - 1] == '.') isOnDecimals = false;
    prompt = prompt.substring(0, prompt.length - 2);
    if (prompt.isEmpty) prompt = '0';
    notifyListeners();
  }

  calculatePrompt() {
    String expresion = prompt;
    // Llamamos a la función auxiliar para evaluar la expresión
    previousResult =
        CalculatorAlgorithm.resolverExpresionMatematica(expresion).toString();
    previousPrompt = expresion;
    result = previousResult;
    prompt = result.toString();
    notifyListeners();
  }
}
