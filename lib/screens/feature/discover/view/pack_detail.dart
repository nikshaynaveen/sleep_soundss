import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/favorite_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/navigation_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/bottom_container_provider.dart';
import 'package:sleep_sounds/screens/common_widgets/home_page.dart';
import 'package:sleep_sounds/screens/feature/discover/view/discover.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/bottom_container.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/custom_bottom_nav_bar.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/expanded_bottom_container.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/mood_dream.dart';

class PackDetail extends StatelessWidget {
  final String title;
  final String albumArt;
  final String category;
  final String subtitle;
  final String description;
  final String image;
  final List<Map<String, String>> songs;
  final String mood;
  final String dreams;

  PackDetail({
    super.key,
    required this.title,
    required this.albumArt,
    required this.category,
    required this.subtitle,
    required this.image,
    required this.description,
    required this.songs,
    required this.mood,
    required this.dreams,
    required songTitle,
  });

  final List<String> _iconPaths = [
    'assets/icons/discover_icon.png',
    'assets/icons/composer_icon.png',
    'assets/icons/profile_icon.png',
  ];

  final List<String> _labels = ['Discover', 'Composer', 'Profile'];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final bottomContainerProvider =
        Provider.of<BottomContainerProvider>(context);
    final selectedIndex = navigationProvider.selectedIndex;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            height: screenHeight,
            width: screenWidth,
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
                padding: EdgeInsets.only(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.03,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios,
                          color: Color(0xff4870FF)),
                      iconSize: screenWidth * 0.06,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(
                      'Sleep',
                      style: TextStyle(
                        fontFamily: 'SF',
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff4870FF),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.2),
                    // Mood and Dreams Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MoodDream(
                          icon: Image.asset(
                            'assets/icons/moodicon.png',
                            scale: 0.8,
                            width: screenWidth * 0.1,
                            height: screenHeight * 0.05,
                          ),
                          title: 'Mood',
                          subtitle: mood,
                        ),
                        SizedBox(width: screenWidth * 0.07),
                        MoodDream(
                          icon: Image.asset(
                            'assets/icons/dreamicon.png',
                            scale: 0.8,
                            width: screenWidth * 0.1,
                            height: screenHeight * 0.05,
                          ),
                          title: 'Dreams',
                          subtitle: dreams,
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
                                  category: category,
                                  albumArt: albumArt,
                                );
                              },
                            ).whenComplete(() {
                              bottomContainerProvider.collapse();
                            });
                          }
                        },
                        child: BottomContainer(
                          title: title,
                          albumArt: albumArt,
                          subtitle: subtitle,
                          isFavorite: favoriteProvider.isFavorite(title),
                          onFavoriteToggle: () {
                            favoriteProvider.toggleFavorite(title);
                          },
                          category: category,
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
                  // ignore: use_build_context_synchronously
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
