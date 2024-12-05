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

    final screenWidth = MediaQuery.of(context).size.width;

    return GridView.builder(
      padding: EdgeInsets.all(screenWidth * 0.035),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: screenWidth * 0.015,
        mainAxisSpacing: screenWidth * 0.015,
        childAspectRatio: 0.75,
      ),
      itemCount: filteredItems.length,
      itemBuilder: (context, index) {
        final item = filteredItems[index];
        return _buildGridItem(context, item, favoriteProvider, screenWidth);
      },
    );
  }

  Widget _buildGridItem(
    BuildContext context,
    Map<String, dynamic> item,
    FavoriteProvider favoriteProvider,
    double screenWidth,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PackDetail(
              title: item['title']!,
              albumArt: item['pack bg image']!,
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
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
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
                      borderRadius: BorderRadius.circular(screenWidth * 0.03),
                      border: Border.all(
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: const Color(0xff21283f),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenWidth * 0.02,
                    left: screenWidth * 0.02,
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
                        width: screenWidth * 0.08,
                        height: screenWidth * 0.08,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(122, 13, 25, 62),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          size: screenWidth * 0.06,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenWidth * 0.02),
            Text(
              item['title']!,
              style: TextStyle(
                fontFamily: 'SF',
                color: Colors.white,
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: screenWidth * 0.01),
            Row(
              children: [
                Text(
                  item['no of songs']!,
                  style: TextStyle(
                    fontFamily: 'SF',
                    color: const Color(0xff79839c),
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w400,
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
                  item['category']!,
                  style: TextStyle(
                    fontFamily: 'SF',
                    color: const Color(0xff79839c),
                    fontSize: screenWidth * 0.035,
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
