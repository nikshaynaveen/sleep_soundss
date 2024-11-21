import 'package:flutter/material.dart';
import 'package:sleep_sounds/widgets/playfavbutton.dart';

class BottomContainer extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFavorite;
  final Function onFavoriteToggle;

  const BottomContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xff141927),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(
            thickness: 2,
            color: Color(0xff2D344B),
            endIndent: 155,
            indent: 155,
          ),
          // Title and Subtitle
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
              fontFamily: 'Nunito',
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 18,
              fontFamily: 'Nunito',
            ),
          ),
          const SizedBox(height: 28),
          const Divider(color: Color(0xff21283f)),
          const SizedBox(height: 2),
          PlayFavButton(
              isFavorite: isFavorite, onFavoriteToggle: onFavoriteToggle),

          const SizedBox(height: 2),
          const Divider(color: Color(0xff21283f)),
        ],
      ),
    );
  }
}
