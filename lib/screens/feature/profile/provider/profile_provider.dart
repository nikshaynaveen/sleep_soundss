import 'package:flutter/material.dart';

class ProfileProvider extends ChangeNotifier {
  bool _isLoggedIn = true;

  bool get isLoggedIn => _isLoggedIn;

  void toggleLoginStatus() {
    _isLoggedIn = !_isLoggedIn;
    notifyListeners();
  }
}
