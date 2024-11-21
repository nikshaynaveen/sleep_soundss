import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/widgets/playfavbutton.dart';
import 'package:sleep_sounds/providers/favorite_provider.dart';

class ExpandedDetail extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final List<Map<String, String>> songs;

  const ExpandedDetail({
    super.key,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xff141927),
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Consumer<FavoriteProvider>(
        builder: (context, favoriteProvider, child) {
          final isFavorite = favoriteProvider.isFavorite(title);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
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
              // Subtitle
              Text(
                subtitle,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 18,
                  fontFamily: 'Nunito',
                ),
              ),
              const SizedBox(height: 20),
              const Divider(color: Color(0xff21283f)),

              // Play and Favorite Button
              PlayFavButton(
                isFavorite: isFavorite,
                onFavoriteToggle: () {
                  favoriteProvider.toggleFavorite(title);
                },
              ),
              const Divider(color: Color(0xff21283f)),

              const SizedBox(height: 20),
              const Text(
                'About this Pack',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Nunito',
                ),
              ),
              const SizedBox(height: 10),
              // Description
              Text(
                description,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                  fontFamily: 'Nunito',
                ),
              ),
              const SizedBox(height: 20),
            ],
          );
        },
      ),
    );
  }
}
