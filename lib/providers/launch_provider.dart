import 'package:flutter/material.dart';

class LaunchProvider extends ChangeNotifier {
  bool _isLaunched = false;

  bool get isLaunched => _isLaunched;

  void initiateLaunch(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      _isLaunched = true;
      notifyListeners();
      Navigator.pushReplacementNamed(context, '/loginslides');
    });
  }
}
