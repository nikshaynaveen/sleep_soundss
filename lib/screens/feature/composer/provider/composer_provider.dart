import 'package:flutter/material.dart';

class ComposerProvider with ChangeNotifier {
  // List to track button click states
  List<bool> _buttonClicked = [];

  List<bool> get buttonClicked => _buttonClicked;

  // Set the button clicked state
  void toggleButtonClick(int index) {
    _buttonClicked[index] = !_buttonClicked[index];
    notifyListeners();
  }

  // Initialize button clicked states
  void initializeButtons(int length) {
    _buttonClicked = List.filled(length, false);
    notifyListeners();
  }
}
