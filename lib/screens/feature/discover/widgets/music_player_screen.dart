import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final provider = Provider.of<MusicPlayerProvider>(context, listen: false);
    provider.initialize(songUrl);

    return Scaffold(
      backgroundColor: const Color(0xff141927),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: IconButton(
                icon: SvgPicture.asset('assets/icons/collapse_arrow_down.svg',
                    width: screenWidth * 0.06,
                    height: screenWidth * 0.06,
                    colorFilter: const ColorFilter.mode(
                      Color.fromARGB(87, 255, 255, 255),
                      BlendMode.srcIn,
                    )),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SizedBox(height: screenHeight * 0.08), // Responsive spacing

            // Album Art
            Container(
              height: screenWidth * 0.45, // Responsive album art size
              width: screenWidth * 0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(albumArt),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing

            // Pack Name
            Text(
              title,
              style: TextStyle(
                fontFamily: 'SF',
                fontSize: screenWidth * 0.05, // Responsive font size
                color: Colors.white70,
              ),
            ),
            SizedBox(height: screenHeight * 0.01), // Responsive spacing

            // Song Title
            Text(
              songTitle,
              style: TextStyle(
                fontFamily: 'SF',
                fontSize: screenWidth * 0.085, // Responsive font size
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Responsive spacing

            // Progress Bar
            Consumer<MusicPlayerProvider>(
              builder: (context, provider, _) {
                return SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 6.0,
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
                );
              },
            ),

            // Timer Display
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consumer<MusicPlayerProvider>(
                    builder: (context, provider, _) {
                      return Text(
                        _formatDuration(provider.currentPosition),
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'SF',
                          fontSize: screenWidth * 0.035, // Responsive font size
                        ),
                      );
                    },
                  ),
                  Consumer<MusicPlayerProvider>(
                    builder: (context, provider, _) {
                      return Text(
                        _formatDuration(provider.totalDuration),
                        style: TextStyle(
                          color: Colors.white70,
                          fontFamily: 'SF',
                          fontSize: screenWidth * 0.035, // Responsive font size
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.06), // Responsive spacing

            // Control Buttons
            Consumer<MusicPlayerProvider>(
              builder: (context, provider, _) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.fast_rewind,
                        size: screenWidth * 0.1, // Responsive icon size
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Functionality for previous song
                      },
                    ),
                    SizedBox(width: screenWidth * 0.05), // Responsive spacing
                    IconButton(
                      icon: Icon(
                        provider.isPlaying ? Icons.pause : Icons.play_arrow,
                        size: screenWidth * 0.1, // Responsive icon size
                        color: Colors.white,
                      ),
                      onPressed: provider.togglePlayPause,
                    ),
                    SizedBox(width: screenWidth * 0.05), // Responsive spacing
                    IconButton(
                      icon: Icon(
                        Icons.fast_forward,
                        size: screenWidth * 0.1, // Responsive icon size
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Functionality for next song
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
