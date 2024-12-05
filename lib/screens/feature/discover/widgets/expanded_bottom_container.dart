import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/navigation_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/custom_bottom_nav_bar.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/featured_on_list.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/play_fav_button.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/favorite_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/song_list_widget.dart';

class ExpandedBottomContainer extends StatelessWidget {
  final String title;
  final String albumArt;
  final String category;
  final String subtitle;
  final String description;
  final List<Map<String, String>> songs;

  ExpandedBottomContainer({
    super.key,
    required this.title,
    required this.albumArt,
    required this.category,
    required this.subtitle,
    required this.description,
    required this.songs,
  });

  final List<String> _iconPaths = [
    'assets/icons/discover_icon.png',
    'assets/icons/composer_icon.png',
    'assets/icons/profile_icon.png',
  ];

  final List<String> _labels = ['Discover', 'Composer', 'Profile'];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final selectedIndex = navigationProvider.selectedIndex;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromARGB(0, 20, 25, 39),
      body: Column(
        children: [
          // AppBar
          Container(
            padding: EdgeInsets.only(
              top: screenHeight * 0.05,
              left: screenWidth * 0.03,
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Color(0xff4870FF)),
                  iconSize: screenWidth * 0.06,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'Sleep',
                  style: TextStyle(
                    fontFamily: 'SF',
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff4870FF),
                  ),
                ),
              ],
            ),
          ),
          // Expanded Container
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05,
                vertical: screenHeight * 0.02,
              ),
              decoration: const BoxDecoration(
                color: Color(0xff141927),
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Consumer<FavoriteProvider>(
                builder: (context, favoriteProvider, child) {
                  final isFavorite = favoriteProvider.isFavorite(title);

                  return ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(
                            thickness: screenHeight * 0.005,
                            color: const Color(0xff2D344B),
                            endIndent: screenWidth * 0.35,
                            indent: screenWidth * 0.35,
                          ),
                          // Title
                          Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.08,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'SF',
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          // Subtitle
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
                                padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.01),
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
                          SizedBox(height: screenHeight * 0.01),

                          // Play and Favorite Button
                          PlayFavButton(
                            isFavorite: isFavorite,
                            onFavoriteToggle: () {
                              favoriteProvider.toggleFavorite(title);
                            },
                            title: title,
                            albumArt: albumArt,
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          const Divider(color: Color(0xff21283f)),
                          SizedBox(height: screenHeight * 0.02),
                          Text(
                            'About this Pack',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'SF',
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          // Description
                          Text(
                            description,
                            style: TextStyle(
                              color: const Color(0xff9597a3),
                              fontSize: screenWidth * 0.04,
                              fontFamily: 'SF',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          // Pass the dynamic songs list to SongListWidget
                          SongListWidget(songs: songs),
                          SizedBox(height: screenHeight * 0.03),
                          Text(
                            'Featured On',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.045,
                              fontFamily: 'SF',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          SizedBox(
                            height: screenHeight * 0.3,
                            child: FeaturedOnList(),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          // Bottom Navigation Bar
          CustomBottomNavBar(
            iconPaths: _iconPaths,
            labels: _labels,
            selectedIndex: selectedIndex,
            onTap: (index) => navigationProvider.setIndex(index),
          ),
        ],
      ),
    );
  }
}
