import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/composer/composer.dart';
import 'package:sleep_sounds/screens/profile/profile.dart';
import 'package:sleep_sounds/screens/discover/discover.dart';
import 'package:sleep_sounds/providers/navigation_provider.dart';
import 'package:sleep_sounds/widgets/custom_bottom_nav_bar.dart.dart';

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
    final selectedIndex = navigationProvider.selectedIndex;

    return Scaffold(
      body: _pages[selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        iconPaths: _iconPaths,
        labels: _labels,
        selectedIndex: selectedIndex,
        onTap: (index) => navigationProvider.setIndex(index),
      ),
    );
  }
}
