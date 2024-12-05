import 'package:flutter/material.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/play_fav_button.dart';

class BottomContainer extends StatelessWidget {
  final String title;
  final String albumArt;
  final String category;
  final String subtitle;
  final bool isFavorite;
  final VoidCallback onFavoriteToggle;

  const BottomContainer({
    super.key,
    required this.title,
    required this.albumArt,
    required this.category,
    required this.subtitle,
    required this.isFavorite,
    required this.onFavoriteToggle,
  });

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.only(
        left: screenWidth * 0.05,
        right: screenWidth * 0.05,
        bottom: screenHeight * 0.02,
      ),
      decoration: const BoxDecoration(
        color: Color(0xff141927),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
            child: Divider(
              thickness: screenHeight * 0.005,
              color: const Color(0xff2D344B),
              endIndent: screenWidth * 0.4,
              indent: screenWidth * 0.4,
            ),
          ),
          // Title and Subtitle
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.085,
              fontWeight: FontWeight.w700,
              fontFamily: 'SF',
            ),
          ),
          SizedBox(height: screenHeight * 0.005),
          Row(
            children: [
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF',
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01),
                child: Text(
                  '•',
                  style: TextStyle(
                    fontFamily: 'SF',
                    color: const Color(0xff79839c),
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Text(
                category,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'SF',
                ),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          const Divider(color: Color(0xff21283f)),
          SizedBox(height: screenHeight * 0.005),

          // Play and Favorite Button
          PlayFavButton(
            isFavorite: isFavorite,
            onFavoriteToggle: onFavoriteToggle,
            title: title, // Pass title
            albumArt: albumArt, // Pass albumArt
          ),

          SizedBox(height: screenHeight * 0.005),
        ],
      ),
    );
  }
}
