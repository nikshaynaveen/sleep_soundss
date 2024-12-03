import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/featured_on_list.dart'; // New widget
import 'package:sleep_sounds/screens/feature/discover/widgets/play_fav_button.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/favorite_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/song_list_widget.dart';

class ExpandedBottomContainer extends StatelessWidget {
  final String title;
  final String category;
  final String subtitle;
  final String description;
  final List<Map<String, String>> songs;

  const ExpandedBottomContainer({
    super.key,
    required this.title,
    required this.category,
    required this.subtitle,
    required this.description,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.89,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                  const Divider(
                    thickness: 4,
                    color: Color(0xff2D344B),
                    endIndent: 165,
                    indent: 165,
                  ),
                  // Title
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
                  // Subtitle
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
                  const SizedBox(height: 10),
                  const Divider(color: Color(0xff21283f)),
                  const SizedBox(height: 6),

                  // Play and Favorite Button
                  PlayFavButton(
                    isFavorite: isFavorite,
                    onFavoriteToggle: () {
                      favoriteProvider.toggleFavorite(title);
                    },
                  ),

                  const SizedBox(height: 6),
                  const Divider(color: Color(0xff21283f)),
                  const SizedBox(height: 10),
                  const Text(
                    'About this Pack',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'SF',
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Description
                  Text(
                    description,
                    style: const TextStyle(
                      color: Color(0xff9597a3),
                      fontSize: 17,
                      fontFamily: 'SF',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Pass the dynamic songs list to SongListWidget
                  SongListWidget(songs: songs),
                  const SizedBox(height: 16),
                  const Text(
                    'Featured On',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontFamily: 'SF',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 14),
                  SizedBox(
                    height: 250,
                    child: FeaturedOnList(),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
