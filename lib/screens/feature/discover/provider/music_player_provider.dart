import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MusicPlayerProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isLoaded = false;
  Duration _totalDuration = Duration.zero;
  Duration _currentPosition = Duration.zero;

  bool get isPlaying => _isPlaying;
  bool get isLoaded => _isLoaded;
  Duration get totalDuration => _totalDuration;
  Duration get currentPosition => _currentPosition;

  Future<void> initialize(String songUrl) async {
    try {
      await _audioPlayer.setUrl(songUrl);

      _audioPlayer.playerStateStream.listen((state) {
        _isPlaying = state.playing;
        notifyListeners();
      });

      _audioPlayer.positionStream.listen((position) {
        _currentPosition = position;
        notifyListeners();
      });

      _audioPlayer.durationStream.listen((duration) {
        _totalDuration = duration ?? Duration.zero;
        notifyListeners();
      });

      _isLoaded = true;
      notifyListeners();
    } catch (e) {
      _isLoaded = false;
      // ignore: avoid_print
      print("Error initializing audio: $e");
      notifyListeners();
    }
  }

  Future<void> togglePlayPause() async {
    if (_isPlaying) {
      await _audioPlayer.pause();
    } else {
      await _audioPlayer.play();
    }
    _isPlaying = !_isPlaying;
    notifyListeners();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}



