// category_tabs.dart
import 'package:flutter/material.dart';

class CategoryTabs extends StatefulWidget {
  final Function(String) onCategorySelected;
  const CategoryTabs({required this.onCategorySelected, super.key});

  @override
  _CategoryTabsState createState() => _CategoryTabsState();
}

class _CategoryTabsState extends State<CategoryTabs> {
  List<Map<String, String>> categories = [
    {'name': 'All', 'icon': 'assets/icons/all.png'},
    {'name': 'Instrumental', 'icon': 'assets/icons/instrumental.png'},
    {'name': 'Ambient', 'icon': 'assets/icons/ambient.png'},
  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          bool isSelected = category['name'] == selectedCategory;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategory = category['name']!;
              });
              widget.onCategorySelected(selectedCategory);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xff4870ff)
                    : const Color(0xff21283f),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Image.asset(
                    category['icon']!,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    category['name']!,
                    style: const TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
