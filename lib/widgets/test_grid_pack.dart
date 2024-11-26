// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/providers/favorite_provider.dart';
import 'package:sleep_sounds/screens/discover/pack_detail.dart';
import 'package:sleep_sounds/screens/music_player_screen.dart';

class TestGridPack extends StatelessWidget {
  final String selectedCategory;

  final List<Map<String, dynamic>> _musicItems = [
    {
      'title': 'Awakening Vibes',
      'no of songs': '3 Songs',
      'category': 'Ambient',
      'grid thumbnail': 'assets/images/awakening.png',
      'pack bg image': 'assets/images/packdetailbg.png',
      'mood': 'Peaceful',
      'dreams': 'Morning Calm',
      'description':
          'Feel the serenity of early mornings with gentle ambient sounds that help you start the day right.',
      'songs': [
        {
          'title': 'Dawn Chorus',
          'artist': 'Artist X',
          'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'
        },
        {
          'title': 'Waking Light',
          'artist': 'Artist Y',
          'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3'
        },
        {
          'title': 'Test Song',
          'artist': 'Artist Y',
          'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3'
        },
      ],
    },
    {
      'title': 'Chill Hop Beats',
      'no of songs': '2 Songs',
      'category': 'For Kids',
      'grid thumbnail': 'assets/images/chill_hop.png',
      'pack bg image': 'assets/images/packdetailbg2.png',
      'mood': 'Playful',
      'dreams': 'Afternoon Adventures',
      'description':
          'Playful beats and melodies perfect for children’s relaxation and joyful moments.',
      'songs': [
        {
          'title': 'Happy Hop',
          'artist': 'DJ Fun',
          'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-4.mp3'
        },
        {
          'title': 'Bouncing Beats',
          'artist': 'MC Cool',
          'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-5.mp3'
        },
        {
          'title': 'Test Song',
          'artist': 'Artist Y',
          'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-6.mp3'
        },
      ],
    },
    {
      'title': 'Guitar Campfire',
      'no of songs': '2 Songs',
      'category': 'Ambient',
      'grid thumbnail': 'assets/images/guitar_camp.png',
      'pack bg image': 'assets/images/packdetailbg3.png',
      'mood': 'Lighthearted',
      'dreams': 'Daydreams',
      'description':
          'Acoustic guitar tunes to soothe your soul and create a cozy campfire atmosphere.',
      'songs': [
        {
          'title': 'Strum Away',
          'artist': 'Artist A',
          'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-7.mp3'
        },
        {
          'title': 'Campfire Tales',
          'artist': 'Artist B',
          'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-8.mp3'
        },
      ],
    },
    {
      'title': 'Guitar at Home',
      'no of songs': '2 Songs',
      'category': 'For Kids',
      'grid thumbnail': 'assets/images/guitar_home.png',
      'pack bg image': 'assets/images/packdetailbg4.png',
      'mood': 'Relaxed',
      'dreams': 'Home Comforts',
      'description':
          'Soft guitar melodies that make you feel right at home, perfect for cozy evenings.',
      'songs': [
        {
          'title': 'Home Strings',
          'artist': 'Artist C',
          'url': 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-9.mp3'
        },
        {
          'title': 'Gentle Riffs',
          'artist': 'Artist D',
          'url':
              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-10.mp3'
        },
      ],
    },
    {
      'title': 'Summer Night Chill',
      'no of songs': '2 Songs',
      'category': 'Ambient',
      'grid thumbnail': 'assets/images/summer_night.png',
      'pack bg image': 'assets/images/packdetailbg5.png',
      'mood': 'Calm',
      'dreams': 'Warm Evenings',
      'description':
          'Relax with cool summer night sounds that take you to a warm and peaceful place.',
      'songs': [
        {
          'title': 'Evening Breeze',
          'artist': 'Artist E',
          'url':
              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-11.mp3'
        },
        {
          'title': 'Summer Night',
          'artist': 'Artist F',
          'url':
              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-12.mp3'
        },
      ],
    },
    {
      'title': 'Winter Night',
      'no of songs': '2 Songs',
      'category': 'For Kids',
      'grid thumbnail': 'assets/images/winter_night.png',
      'pack bg image': 'assets/images/packdetailbg6.png',
      'mood': 'Serene',
      'dreams': 'Winter Dreams',
      'description':
          'Instrumental tunes for a calm and restful winter night, ideal for unwinding.',
      'songs': [
        {
          'title': 'Snowy Evening',
          'artist': 'Artist G',
          'url':
              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-13.mp3'
        },
        {
          'title': 'Frosty Melodies',
          'artist': 'Artist H',
          'url':
              'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-14.mp3'
        },
      ],
    },
  ];

  TestGridPack({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    List<Map<String, dynamic>> filteredItems = _musicItems.where((item) {
      if (selectedCategory == 'All') {
        return true;
      } else {
        return item['category'] == selectedCategory;
      }
    }).toList();

    return GridView.builder(
      padding: const EdgeInsets.all(14),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
        childAspectRatio: 0.75,
      ),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return _buildGridItem(context, item, favoriteProvider);
      },
    );
  }

  Widget _buildGridItem(
    BuildContext context,
    Map<String, dynamic> item,
    FavoriteProvider favoriteProvider,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackDetail(
              title: item['title']!,
              subtitle: item['no of songs']!,
              image: item['pack bg image']!,
              description: item['description']!,
              songs: List<Map<String, String>>.from(item['songs']),
              mood: item['mood'],
              dreams: item['dreams'],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
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
                        image: AssetImage(item['grid thumbnail']!),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xff21283f),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MusicPlayerScreen(
                              title: item['title'] ?? 'Unknown Title',
                              albumArt: item['pack bg image'] ??
                                  'assets/images/default_image.png', // Use a default if missing
                              songUrl: item['songs'] != null &&
                                      item['songs'].isNotEmpty &&
                                      item['songs'][0]['url'] != null
                                  ? item['songs'][0]['url']
                                  : 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3', // Default URL if missing
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xff0d193e),
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          size: 25,
                          color: Colors.white,
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
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item['no of songs']!,
              style: const TextStyle(
                color: Color(0xff79839c),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
