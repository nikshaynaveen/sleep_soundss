import 'package:flutter/foundation.dart';

class ButtonState with ChangeNotifier {
  final Map<String, List<bool>> _sectionStates = {};

  // Getter for section states
  Map<String, List<bool>> get sectionStates => _sectionStates;

  // Initialize button states for a section
  void initializeSection(String sectionKey, int buttonCount) {
    if (!_sectionStates.containsKey(sectionKey)) {
      _sectionStates[sectionKey] = List.filled(buttonCount, false);
    }
  }

  // Toggle button state
  void toggleButton(String sectionKey, int buttonIndex) {
    if (_sectionStates[sectionKey] != null) {
      _sectionStates[sectionKey]![buttonIndex] =
          !_sectionStates[sectionKey]![buttonIndex];
      notifyListeners();
    }
  }

  // Get button state
  bool getButtonState(String sectionKey, int buttonIndex) {
    return _sectionStates[sectionKey]?[buttonIndex] ?? false;
  }
}
