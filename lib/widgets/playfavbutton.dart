import 'package:flutter/material.dart';
import 'package:sleep_sounds/widgets/custom_button.dart';

class PlayFavButton extends StatelessWidget {
  final bool isFavorite;
  final Function onFavoriteToggle;
  const PlayFavButton(
      {super.key, required this.isFavorite, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return // Play and Favorite Buttons
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
          icon: Icons.play_arrow,
          // iconcolor: Colors.white,
          label: 'Play',
          color: const Color(0xff4870ff), // Darker background
          onPressed: () {},
          textStyle: const TextStyle(
            color: Colors.white,
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        // Favorite Button
        CustomButton(
          iconcolor: isFavorite ? Colors.orange : Colors.white,
          icon: isFavorite ? Icons.star_half : Icons.star,
          label: isFavorite ? 'Unfavorite' : 'Favorite',
          color: const Color(0xff21283f), // Darker background
          onPressed: () {
            onFavoriteToggle();
          },
          textStyle: TextStyle(
            color: isFavorite ? Colors.orange : Colors.white,
            fontFamily: 'Nunito',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
