import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/music_player_provider.dart';

class MiniMusicPlayer extends StatelessWidget {
  final String title;
  final String songTitle;
  final String albumArt;
  final VoidCallback onTap;

  const MiniMusicPlayer({
    super.key,
    required this.title,
    required this.songTitle,
    required this.albumArt,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 75,
        child: Stack(
          children: [
            // Background Blur and Color
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff141927).withOpacity(0.24),
                  ),
                ),
              ),
            ),
            // Player Content
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  // Album Art
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      albumArt,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Song Title and Pack Name
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontFamily: 'SF',
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                            fontFamily: 'SF',
                            color: Colors.white70,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Play, Pause, and Forward Buttons
                  Consumer<MusicPlayerProvider>(
                    builder: (context, provider, _) {
                      return Row(
                        children: [
                          // Play/Pause Button
                          IconButton(
                            icon: Icon(
                              provider.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: provider.togglePlayPause,
                          ),
                          // Fast Forward Button
                          IconButton(
                            icon: const Icon(Icons.fast_forward,
                                color: Colors.white),
                            onPressed: () {
                              // Add functionality for skipping forward
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
