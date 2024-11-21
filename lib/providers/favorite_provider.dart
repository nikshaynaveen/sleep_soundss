import 'package:flutter/material.dart';

class FavoriteProvider extends ChangeNotifier {
  // This map will store the favorite status for each item by title
  final Map<String, bool> _favorites = {};

  // Method to check if an item is favorited
  bool isFavorite(String title) {
    return _favorites[title] ?? false;
  }

  // Method to toggle the favorite status
  void toggleFavorite(String title) {
    // Toggle the favorite status of the item
    _favorites[title] = !(_favorites[title] ?? false);

    // Notify listeners so that UI updates accordingly
    notifyListeners();
  }
}
