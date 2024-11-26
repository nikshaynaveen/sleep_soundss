import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  final Set<String> _favoriteTitles = {}; // Store item titles as favorites

  bool isFavorite(String title) {
    return _favoriteTitles.contains(title);
  }

  void toggleFavorite(String title) {
    if (_favoriteTitles.contains(title)) {
      _favoriteTitles.remove(title);
    } else {
      _favoriteTitles.add(title);
    }
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}
