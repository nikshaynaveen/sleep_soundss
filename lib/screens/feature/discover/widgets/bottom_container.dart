import 'package:flutter/material.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/play_fav_button.dart';

class BottomContainer extends StatelessWidget {
  final String title;
  final String category;
  final String subtitle;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const BottomContainer({
    super.key,
    required this.title,
    required this.category,
    required this.subtitle,
    required this.isFavorite,
    required this.onFavoriteToggle,
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(
              thickness: 4,
              color: Color(0xff2D344B),
              endIndent: 160,
              indent: 160,
            ),
          ),
          // Title and Subtitle
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF',
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF',
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  '•',
                  style: TextStyle(
                    fontFamily: 'SF',
                    color: Color(0xff79839c),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                category,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF',
                ),
              ),
            ],
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
