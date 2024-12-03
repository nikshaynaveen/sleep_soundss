// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/models/music_data.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/favorite_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/mini_music_player_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/view/pack_detail.dart';

class MusicPackGrid extends StatelessWidget {
  final String selectedCategory;

  const MusicPackGrid({super.key, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    List<Map<String, dynamic>> filteredItems = musicItems.where((item) {
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
              category: item['category']!,
              image: item['pack bg image']!,
              description: item['description']!,
              songs: List<Map<String, String>>.from(item['songs']),
              mood: item['mood'],
              dreams: item['dreams'],
              songTitle: item['songs'] != null &&
                      item['songs'].isNotEmpty &&
                      item['songs'][0]['song title'] != null
                  ? item['songs'][0]['song title']!
                  : 'Unknown Song Title',
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
                        final miniPlayerProvider =
                            Provider.of<MiniMusicPlayerProvider>(context,
                                listen: false);
                        miniPlayerProvider.playSong(
                          item['title']!,
                          item['pack bg image']!,
                        );
                      },
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(122, 13, 25, 62),
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
                fontFamily: 'SF',
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text(
                  item['no of songs']!,
                  style: const TextStyle(
                    fontFamily: 'SF',
                    color: Color(0xff79839c),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
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
                  item['category']!,
                  style: const TextStyle(
                    fontFamily: 'SF',
                    color: Color(0xff79839c),
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
