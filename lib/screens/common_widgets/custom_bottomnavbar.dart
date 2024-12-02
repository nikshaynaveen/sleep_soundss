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

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Widget> _pages = const [
    Discover(),
    Composer(),
    Profile(),
  ];

  final List<String> _iconPaths = [
    'assets/icons/discover_icon.png',
    'assets/icons/composer_icon.png',
    'assets/icons/profile_icon.png',
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
          _pages[selectedIndex],

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
