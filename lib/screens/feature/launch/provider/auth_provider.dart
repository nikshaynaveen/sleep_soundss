import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  int currentSlide = 0;
  final PageController pageController = PageController();

  void setSlide(int index) {
    currentSlide = index;
    notifyListeners();
  }

  void nextSlide() {
    if (currentSlide < 2) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousSlide() {
    if (currentSlide > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
