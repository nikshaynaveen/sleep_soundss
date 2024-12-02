import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/favorite_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/navigation_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/bottom_container_provider.dart';
import 'package:sleep_sounds/screens/common_widgets/custom_bottomnavbar.dart';
import 'package:sleep_sounds/screens/feature/discover/view/discover.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/bottom_container.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/custom_bottom_nav_bar.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/expanded_bottom_container.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/mood_dream.dart';

class PackDetail extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final String image;
  final List<Map<String, String>> songs;
  final String mood; // <-- Added mood
  final String dreams; // <-- Added dreams

  PackDetail({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.description,
    required this.songs,
    required this.mood, // <-- Added mood
    required this.dreams, // <-- Added dreams
  });

  final List<String> _iconPaths = [
    'assets/icons/discover_icon.png',
    'assets/icons/composer_icon.png',
    'assets/icons/profile_icon.png',
  ];

  final List<String> _labels = ['Discover', 'Composer', 'Profile'];

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final bottomContainerProvider =
        Provider.of<BottomContainerProvider>(context);
    final selectedIndex = navigationProvider.selectedIndex;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              // AppBar
              Container(
                padding: const EdgeInsets.only(top: 40.0, left: 10.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Color(0xff4870FF), size: 30),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Text(
                      'Sleep',
                      style: TextStyle(
                        fontFamily: 'SF',
                        fontSize: 22,
                        color: Color(0xff4870FF),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 170),
                    // Mood and Dreams
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MoodDream(
                          icon: Image.asset('assets/icons/moodicon.png',
                              scale: 0.8, width: 36, height: 36),
                          title: 'Mood',
                          subtitle: mood, // <-- Use dynamic mood
                        ),
                        const SizedBox(width: 30),
                        MoodDream(
                          icon: Image.asset('assets/icons/dreamicon.png',
                              scale: 0.8, width: 36, height: 36),
                          title: 'Dreams',
                          subtitle: dreams, // <-- Use dynamic dreams
                        ),
                      ],
                    ),
                    const Spacer(),
                    // Bottom Container

                    if (!bottomContainerProvider.isExpanded)
                      GestureDetector(
                        onVerticalDragUpdate: (details) {
                          if (details.primaryDelta! < -10) {
                            bottomContainerProvider.expand();
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.transparent,
                              isScrollControlled: true,
                              builder: (context) {
                                return ExpandedBottomContainer(
                                  title: title,
                                  subtitle: subtitle,
                                  description: description,
                                  songs: songs,
                                );
                              },
                            ).whenComplete(() {
                              bottomContainerProvider.collapse();
                            });
                          }
                        },
                        child: BottomContainer(
                          title: title,
                          subtitle: subtitle,
                          isFavorite: favoriteProvider
                              .isFavorite(title), // Get from provider
                          onFavoriteToggle: () {
                            favoriteProvider.toggleFavorite(
                                title); // Update the favorite state
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
      bottomNavigationBar: CustomBottomNavBar(
        iconPaths: _iconPaths,
        labels: _labels,
        selectedIndex: selectedIndex,
        onTap: (index) {
          if (index != selectedIndex) {
            navigationProvider.setIndex(index);

            if (index == 0) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false,
              ).then((_) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Discover()),
                  (route) => false,
                );
              });
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
                (route) => false,
              );
            }
          }
        },
      ),
    );
  }
}
