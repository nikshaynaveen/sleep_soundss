import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  int _currentSlide = 0;

  // The number of slides
  final int _totalSlides = 3;

  int get currentSlide => _currentSlide;

  // Get the total number of slides
  int get totalSlides => _totalSlides;

  // Go to the next slide (increment index)
  void nextSlide() {
    if (_currentSlide < _totalSlides - 1) {
      // Only go to the next slide if not at the last one
      _currentSlide++;
      notifyListeners();
    }
  }

  // Go to the previous slide (decrement index)
  void previousSlide() {
    if (_currentSlide > 0) {
      // Only go to the previous slide if not at the first one
      _currentSlide--;
      notifyListeners();
    }
  }

  // Reset the slide to the first one
  void resetSlides() {
    _currentSlide = 0;
    notifyListeners();
  }
}
