import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  GlobalKey viewKey = GlobalKey();

  int currentPage = 0;
  PageController pageController = PageController(initialPage: 0);
	
  setCurrentPage(int value) {
    currentPage = value;
    notifyListeners();
  }
}
