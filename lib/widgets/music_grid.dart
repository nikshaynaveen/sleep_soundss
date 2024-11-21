import 'package:flutter/material.dart';
import 'package:sleep_sounds/screens/pack_detail_page.dart';

class MusicGrid extends StatelessWidget {
  final String selectedCategory;
  final List<Map<String, dynamic>> _musicItems = [
    {
      'title': 'Guitar Camp',
      'subtitle': '7 Songs • Instrumental',
      'image': 'assets/images/guitar_camp.png',
      'category': 'Instrumental',
      'description':
          'Relax with mellow guitar melodies perfect for campfire nights and peaceful escapes. Pure instrumental warmth for any moment.',
      'songs': [
        {'title': 'Song 1', 'artist': 'Artist A'},
        {'title': 'Song 2', 'artist': 'Artist B'},
      ]
    },
    {
      'title': 'Guitar Camp',
      'subtitle': '7 Songs • Instrumental',
      'image': 'assets/images/guitar_camp.png',
      'category': 'Instrumental',
      'description':
          'Relax with mellow guitar melodies perfect for campfire nights and peaceful escapes. Pure instrumental warmth for any moment.',
      'songs': [
        {'title': 'Song 1', 'artist': 'Artist A'},
        {'title': 'Song 2', 'artist': 'Artist B'},
      ]
    },
    {
      'title': 'Guitar Camp',
      'subtitle': '7 Songs • Instrumental',
      'image': 'assets/images/guitar_camp.png',
      'category': 'Instrumental',
      'description':
          'Relax with mellow guitar melodies perfect for campfire nights and peaceful escapes. Pure instrumental warmth for any moment.',
      'songs': [
        {'title': 'Song 1', 'artist': 'Artist A'},
        {'title': 'Song 2', 'artist': 'Artist B'},
      ]
    },
    {
      'title': 'Guitar Camp',
      'subtitle': '7 Songs • Instrumental',
      'image': 'assets/images/guitar_camp.png',
      'category': 'Instrumental',
      'description':
          'Relax with mellow guitar melodies perfect for campfire nights and peaceful escapes. Pure instrumental warmth for any moment.',
      'songs': [
        {'title': 'Song 1', 'artist': 'Artist A'},
        {'title': 'Song 2', 'artist': 'Artist B'},
      ]
    },
  ];

  MusicGrid({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    // Filter items based on the selected category
    List<Map<String, dynamic>> filteredItems = _musicItems.where((item) {
      if (selectedCategory == 'All') {
        return true;
      } else {
        return item['category'] == selectedCategory;
      }
    }).toList();

    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 1.0,
        childAspectRatio: 0.70,
      ),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return _buildGridItem(context, item);
      },
    );
  }

  // Method to navigate when grid item is clicked
  Widget _buildGridItem(BuildContext context, Map<String, dynamic> item) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackDetailPage(
              title: item['title']!,
              subtitle: item['subtitle']!,
              image: item['image']!,
              description: item['description']!,
              songs: item['songs'],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  // Play Icon Overlay with light black circular background
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        // Implement play functionality here
                        print("Play button clicked for ${item['title']}");
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6), // light black
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 22, // Adjust size as needed
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
                fontWeight: FontWeight.bold,
                fontFamily: 'Nunito',
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              item['subtitle']!,
              style: const TextStyle(
                color: Colors.white60,
                fontFamily: 'Nunito',
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
