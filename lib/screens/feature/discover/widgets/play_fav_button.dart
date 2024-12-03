import 'package:flutter/material.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/icon_text_button.dart';

class PlayFavButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const PlayFavButton({
    super.key,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    // Play and Favorite button
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconTextButton(
          icon: Icons.play_arrow,
          label: 'Play',
          color: const Color(0xff4870ff),
          onPressed: () {
            // Implement the Play functionality here
          },
          textStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'SF',
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Favorite Button
        IconTextButton(
          iconcolor: isFavorite ? Colors.orange : Colors.white,
          icon: isFavorite ? Icons.star : Icons.star_border,
          label: isFavorite ? 'Unfavorite' : 'Favorite',
          color: const Color(0xff21283f),
          onPressed: () {
            // Toggle the favorite state
            onFavoriteToggle();
          },
          textStyle: TextStyle(
            color: isFavorite ? Colors.orange : Colors.white,
            fontFamily: 'SF',
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
