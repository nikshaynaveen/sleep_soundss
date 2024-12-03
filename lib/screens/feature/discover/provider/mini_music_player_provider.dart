import 'package:flutter/material.dart';

class MiniMusicPlayerProvider extends ChangeNotifier {
  String? currentSongTitle;
  String? currentAlbumArt;

  bool get isVisible => currentSongTitle != null && currentAlbumArt != null;

  void playSong(String songTitle, String albumArt) {
    currentSongTitle = songTitle;
    currentAlbumArt = albumArt;
    notifyListeners();
  }

  void stop() {
    currentSongTitle = null;
    currentAlbumArt = null;
    notifyListeners();
  }
}
