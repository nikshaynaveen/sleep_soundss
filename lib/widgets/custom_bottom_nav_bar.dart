import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final List<String> iconPaths;
  final List<String> labels;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.iconPaths,
    required this.labels,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xff21283F),
        selectedItemColor: const Color(0xff4870ff),
        unselectedItemColor: const Color(0xffbcbec5),
        currentIndex: selectedIndex,
        onTap: onTap,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: List.generate(iconPaths.length, (index) {
          return BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(iconPaths[index]),
              color: index == selectedIndex
                  ? const Color(0xff4870ff)
                  : const Color(0xffbcbec5),
            ),
            label: index == selectedIndex ? labels[index] : '',
          );
        }),
      ),
    );
  }
}
