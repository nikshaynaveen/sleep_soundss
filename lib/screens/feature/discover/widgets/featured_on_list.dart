// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:sleep_sounds/screens/feature/discover/view/pack_detail.dart';

class FeaturedOnList extends StatelessWidget {
  // Sample song data including provided asset images
  final List<Map<String, dynamic>> featuredItems = [
    {
      'title': 'Summer Night',
      'subtitle': '5 Songs • Chill Vibes',
      'image': 'assets/images/summer_night.png',
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
      'image': 'assets/images/awakening.png',
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
      'image': 'assets/images/chill_hop.png',
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
      'image': 'assets/images/guitar_camp.png',
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
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: featuredItems.length,
      itemBuilder: (context, index) {
        final item = featuredItems[index];
        return _buildHorizontalItem(context, item);
      },
    );
  }

  Widget _buildHorizontalItem(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackDetail(
              title: item['title']!,
              subtitle: item['subtitle']!,
              image: item['image']!,
              description: item['description']!,
              songs: item['songs'],
              mood: '',
              dreams: '',
            ),
          ),
        );
      },
      child: Container(
        width: 170,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    top: 8,
                    left: 8,
                    child: GestureDetector(
                      onTap: () {
                        print("Play button clicked for ${item['title']}");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              item['title']!,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'SH',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item['subtitle']!,
              style: const TextStyle(
                fontFamily: 'SH',
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
