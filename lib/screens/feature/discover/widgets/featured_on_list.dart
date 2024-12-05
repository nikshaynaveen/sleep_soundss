import 'package:flutter/material.dart';
import 'package:sleep_sounds/screens/feature/discover/view/pack_detail.dart';
import 'package:sleep_sounds/utilities/images_path.dart';

class FeaturedOnList extends StatelessWidget {
  // Sample song data including provided asset images
  final List<Map<String, dynamic>> featuredItems = [
    {
      'title': 'Summer Night',
      'subtitle': '5 Songs • Chill Vibes',
      'image': summerNightPng,
      'category': 'Chill',
      'description':
          'Bask in the warmth of summer nights with this relaxing pack of chill hop beats and mellow melodies.',
      'songs': [
        {'title': 'Chill Beat 1', 'artist': 'DJ Relax'},
        {'title': 'Smooth Vibes', 'artist': 'Calm Creator'},
        {'title': 'Evening Breeze', 'artist': 'Sunset DJ'},
        {'title': 'Midnight Walk', 'artist': 'Moonlight Melodies'},
        {'title': 'Starry Sky', 'artist': 'Stargazer'},
      ],
    },
    {
      'title': 'Awakening',
      'subtitle': '4 Songs • Morning Tunes',
      'image': awakeningPng,
      'category': 'Morning',
      'description':
          'Start your day with soothing sounds that gently awaken the senses. Perfect for a mindful morning.',
      'songs': [
        {'title': 'Sunrise', 'artist': 'Early Bird'},
        {'title': 'Gentle Breeze', 'artist': 'Nature Sounds'},
        {'title': 'First Light', 'artist': 'Morning Glow'},
        {'title': 'Wake Up Call', 'artist': 'Day Starter'},
      ],
    },
    {
      'title': 'Chill Hop',
      'subtitle': '6 Songs • Instrumental',
      'image': chillHopePng,
      'category': 'Chill',
      'description':
          'Enjoy laid-back beats with a touch of urban groove, perfect for study sessions or relaxing evenings.',
      'songs': [
        {'title': 'Lo-fi Groove', 'artist': 'Beatsmith'},
        {'title': 'Urban Chill', 'artist': 'City Lights'},
        {'title': 'Mellow Mood', 'artist': 'Cool Cat'},
        {'title': 'Downtown Walk', 'artist': 'Street Beats'},
        {'title': 'Night Groove', 'artist': 'Late Night DJ'},
        {'title': 'Smooth Flow', 'artist': 'Vibe Maker'},
      ],
    },
    {
      'title': 'Guitar Camp',
      'subtitle': '7 Songs • Instrumental',
      'image': guitarCampPng,
      'category': 'For Kids',
      'description':
          'Relax with mellow guitar melodies perfect for campfire nights and peaceful escapes. Pure instrumental warmth for any moment.',
      'songs': [
        {'title': 'Acoustic Jam', 'artist': 'Campfire Guitarist'},
        {'title': 'String Serenade', 'artist': 'Soft Strummer'},
        {'title': 'Mellow Melody', 'artist': 'Guitar Maestro'},
        {'title': 'Campfire Story', 'artist': 'Storyteller'},
        {'title': 'Easy Strums', 'artist': 'Gentle Strings'},
        {'title': 'Peaceful Chords', 'artist': 'Harmony Hunter'},
        {'title': 'Guitar Dreams', 'artist': 'Dreamer'},
      ],
    },
  ];

  FeaturedOnList({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: featuredItems.length,
      itemBuilder: (context, index) {
        final item = featuredItems[index];
        return _buildHorizontalItem(context, item, screenWidth, screenHeight);
      },
    );
  }

  Widget _buildHorizontalItem(BuildContext context, Map<String, dynamic> item,
      double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackDetail(
              title: item['title']!,
              albumArt: item['pack bg image']!,
              subtitle: item['subtitle']!,
              image: item['image']!,
              description: item['description']!,
              songs: item['songs'],
              mood: '',
              dreams: '',
              songTitle: item['song title']!,
              category: item['category']!,
            ),
          ),
        );
      },
      child: Container(
        width: screenWidth * 0.45, // Responsive width for the container
        margin: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.03), // Responsive margin
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(item['image']!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xff21283f),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight *
                        0.015, // Responsive position for the play button
                    left: screenWidth * 0.015,
                    child: GestureDetector(
                      onTap: () {
                        // ignore: avoid_print
                        print("Play button clicked for ${item['title']}");
                      },
                      child: Container(
                        padding: EdgeInsets.all(
                            screenWidth * 0.02), // Responsive padding
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: screenWidth * 0.07, // Responsive icon size
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.015), // Responsive spacing
            Text(
              item['title']!,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SF',
                fontSize: screenWidth * 0.045, // Responsive font size
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: screenHeight * 0.008), // Responsive spacing
            Text(
              item['subtitle']!,
              style: TextStyle(
                fontFamily: 'SF',
                color: Colors.white70,
                fontSize: screenWidth * 0.035, // Responsive font size
              ),
            ),
          ],
        ),
      ),
    );
  }
}
