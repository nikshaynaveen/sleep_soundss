import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/providers/favorite_provider.dart';
import 'package:sleep_sounds/widgets/bottom_container.dart';
import 'package:sleep_sounds/widgets/expanded_detail.dart';
import 'package:sleep_sounds/widgets/mood_row.dart';

class PackDetailPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final List<Map<String, String>> songs;

  const PackDetailPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
    required this.songs,
  });

  @override
  Widget build(BuildContext context) {
    // Access the FavoriteProvider using Provider.of<FavoriteProvider>(context)
    final favoriteProvider = Provider.of<FavoriteProvider>(context);

    return Scaffold(
      body: Stack(
        children: [
          // Background Image covering the entire body
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/packdetailbg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content Overlay
          Column(
            children: [
              // AppBar
              Container(
                color: const Color(0xff000014).withOpacity(0.8),
                padding: const EdgeInsets.only(top: 40.0, left: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Colors.white, size: 30),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              // Rest of the content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 170),
                    // Mood and Dreams
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MoodRow(
                          icon: Image.asset('assets/icons/moodicon.png',
                              scale: 0.8, width: 36, height: 36),
                          title: 'Mood',
                          subtitle: 'Lighthearted',
                        ),
                        const SizedBox(width: 30),
                        MoodRow(
                          icon: Image.asset('assets/icons/dreamicon.png',
                              scale: 0.8, width: 36, height: 36),
                          title: 'Dreams',
                          subtitle: 'Daydreams',
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Bottom Container
                    GestureDetector(
                      onVerticalDragUpdate: (details) {
                        if (details.primaryDelta! < -10) {
                          showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            isScrollControlled: true,
                            builder: (context) {
                              return ExpandedDetail(
                                title: title,
                                subtitle: subtitle,
                                description: description,
                                songs: songs,
                              );
                            },
                          );
                        }
                      },
                      child: BottomContainer(
                        title: title,
                        subtitle: subtitle,
                        isFavorite: favoriteProvider.isFavorite(title),
                        onFavoriteToggle: () {
                          favoriteProvider.toggleFavorite(title);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
