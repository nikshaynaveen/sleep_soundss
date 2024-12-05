import 'package:flutter/material.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/icon_text_button.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/mini_music_player_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/music_player_screen.dart';

class PlayFavButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;
  final String title;
  final String albumArt;

  const PlayFavButton({
    super.key,
    required this.isFavorite,
    required this.onFavoriteToggle,
    required this.title,
    required this.albumArt,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;

    // Play and Favorite button
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05, // Responsive horizontal padding
      ),
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceBetween, // Distribute buttons evenly
        children: [
          // Play Button
          Flexible(
            child: IconTextButton(
              icon: Icons.play_arrow,
              label: 'Play',
              color: const Color(0xff4870ff),
              onPressed: () {
                // Navigate to the MusicPlayerScreen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MusicPlayerScreen(
                      title:
                          title, // Pass the required details to the MusicPlayerScreen
                      albumArt: albumArt,
                      songUrl:
                          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', // Use your actual song URL
                      songTitle: title, // Use the song's title
                    ),
                  ),
                );
              },
              textStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'SF',
                fontSize: screenWidth * 0.04, // Responsive font size
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.05), // Responsive spacing
          // Favorite Button
          Flexible(
            child: IconTextButton(
              iconcolor: isFavorite ? Colors.orange : Colors.white,
              icon: isFavorite ? Icons.star : Icons.star_border,
              label: isFavorite ? 'Unfavorite' : 'Favorite',
              color: const Color(0xff21283f),
              onPressed: onFavoriteToggle,
              textStyle: TextStyle(
                color: isFavorite ? Colors.orange : Colors.white,
                fontFamily: 'SF',
                fontSize: screenWidth * 0.04, // Responsive font size
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
