import 'package:flutter/material.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/play_fav_button.dart';

class BottomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFavorite; // <-- Add this
  final VoidCallback onFavoriteToggle; // <-- Add this

  const BottomContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isFavorite, // <-- Add this
    required this.onFavoriteToggle, // <-- Add this
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: const BoxDecoration(
        color: Color(0xff141927),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            thickness: 4,
            color: Color(0xff2D344B),
            endIndent: 165,
            indent: 165,
          ),
          // Title and Subtitle
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              fontFamily: 'SF',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontFamily: 'SF',
            ),
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xff21283f)),
          const SizedBox(height: 2),

          // Play and Favorite Button
          PlayFavButton(
            isFavorite: isFavorite,
            onFavoriteToggle: onFavoriteToggle,
          ),

          const SizedBox(height: 2),
        ],
      ),
    );
  }
}
