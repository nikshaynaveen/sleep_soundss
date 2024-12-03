import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/music_player_provider.dart';

class MusicPlayerScreen extends StatelessWidget {
  final String title;
  final String albumArt;
  final String songUrl;
  final String songTitle;

  const MusicPlayerScreen({
    super.key,
    required this.title,
    required this.albumArt,
    required this.songUrl,
    required this.songTitle,
  });

  // Helper function to format the duration
  String _formatDuration(Duration duration) {
    return duration.toString().split('.').first.substring(2);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final provider = MusicPlayerProvider();
        provider.initialize(songUrl);
        return provider;
      },
      child: Consumer<MusicPlayerProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: const Color(0xff141927),
            body: SafeArea(
              child: Column(
                children: [
                  // Collapse Icon
                  Center(
                    child: IconButton(
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        size: 30,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Functionality to be added later
                      },
                    ),
                  ),
                  const SizedBox(height: 120),
                  // Album Art
                  Container(
                    height: 164,
                    width: 164,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(albumArt),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Pack Name
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'SF',
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Song Title
                  Text(
                    songTitle,
                    style: const TextStyle(
                      fontFamily: 'SF',
                      fontSize: 34,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Progress Bar
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: const RoundSliderThumbShape(
                        enabledThumbRadius: 6.0, // Adjust the radius size
                      ),
                      activeTrackColor: const Color(0xff4870FF),
                      inactiveTrackColor: const Color(0xff21283F),
                      thumbColor: const Color(0xff4870FF),
                      overlayColor: const Color(0xff4870FF).withOpacity(0.2),
                    ),
                    child: Slider(
                      value: provider.currentPosition.inSeconds.toDouble(),
                      min: 0.0,
                      max: provider.totalDuration.inSeconds > 0
                          ? provider.totalDuration.inSeconds.toDouble()
                          : 1.0,
                      onChanged: (value) {
                        provider.seek(Duration(seconds: value.toInt()));
                      },
                    ),
                  ),

                  // Timer Display
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _formatDuration(provider.currentPosition),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontFamily: 'SF',
                          ),
                        ),
                        Text(
                          _formatDuration(provider.totalDuration),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontFamily: 'SF',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),
                  // Control Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Previous Song Icon
                      IconButton(
                        icon: const Icon(
                          Icons.skip_previous,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Functionality for previous song
                        },
                      ),
                      const SizedBox(width: 20),
                      // Play/Pause Button
                      IconButton(
                        icon: Icon(
                          provider.isPlaying ? Icons.pause : Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: provider.togglePlayPause,
                      ),
                      const SizedBox(width: 20),
                      // Next Song Icon
                      IconButton(
                        icon: const Icon(
                          Icons.skip_next,
                          size: 40,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Functionality for next song
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
