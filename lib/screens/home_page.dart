import 'package:flutter/material.dart';
import 'package:sleep_sounds/screens/music.dart';
import 'package:sleep_sounds/screens/profile.dart';
import 'package:sleep_sounds/screens/sleep.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Sleep(),
    const Music(),
    const Profile(),
  ];

  final List<String> _iconPaths = [
    'assets/icons/sleep_icon.png',
    'assets/icons/music_icon.png',
    'assets/icons/profile_icon.png',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xff21283F),
          selectedItemColor: const Color(0xff4870ff),
          unselectedItemColor: const Color(0xffbcbec5),
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: List.generate(3, (index) {
            return BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage(_iconPaths[index]),
                color: index == _selectedIndex
                    ? const Color(0xff4870ff)
                    : const Color(0xffbcbec5),
              ),
              label: index == _selectedIndex
                  ? ['Sleep', 'Composer', 'Profile'][index]
                  : '',
            );
          }),
        ),
      ),
    );
  }
}
