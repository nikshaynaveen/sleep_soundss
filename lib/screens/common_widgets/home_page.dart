import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/composer/view/composer.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/mini_music_player_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/music_player_screen.dart';
import 'package:sleep_sounds/screens/feature/profile/view/profile.dart';
import 'package:sleep_sounds/screens/feature/discover/view/discover.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/navigation_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/custom_bottom_nav_bar.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/mini_music_player.dart';
import 'package:sleep_sounds/utilities/images_path.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> _pages = const [
    Discover(),
    Composer(),
    Profile(),
  ];

  final List<String> _iconPaths = [
    discoverIconPng,
    composerIconPng,
    profileIconPng,
  ];

  final List<String> _labels = ['Discover', 'Composer', 'Profile'];

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final miniPlayerProvider = Provider.of<MiniMusicPlayerProvider>(context);
    final selectedIndex = navigationProvider.selectedIndex;

    return Scaffold(
      body: Stack(
        children: [
          // Current page content
          // ignore: deprecated_member_use
          WillPopScope(
            onWillPop: () async {
              // If we are on Composer or Profile page, return false to prevent exit
              if (selectedIndex == 1 || selectedIndex == 2) {
                navigationProvider.setIndex(0); // Navigate to Discover
                return false; // Prevent app from exiting
              }
              return true; // Allow the back button to exit the app
            },
            child: _pages[selectedIndex],
          ),

          // Mini Music Player
          if (miniPlayerProvider.isVisible)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0, // Adjust based on the CustomBottomNavBar height
              child: MiniMusicPlayer(
                title: miniPlayerProvider.currentSongTitle!,
                albumArt: miniPlayerProvider.currentAlbumArt!,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MusicPlayerScreen(
                        title: miniPlayerProvider.currentSongTitle!,
                        albumArt: miniPlayerProvider.currentAlbumArt!,
                        songUrl:
                            'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
                        songTitle: miniPlayerProvider.currentSongTitle!,
                      ),
                    ),
                  );
                },
                songTitle: '',
              ),
            ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        iconPaths: _iconPaths,
        labels: _labels,
        selectedIndex: selectedIndex,
        onTap: (index) => navigationProvider.setIndex(index),
      ),
    );
  }
}
