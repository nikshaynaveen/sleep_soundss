import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/category_provider.dart';

class CategoryTabs extends StatelessWidget {
  final Function(String) onCategorySelected;
  CategoryTabs({required this.onCategorySelected, super.key});

  final List<Map<String, String>> categories = [
    {'name': 'All', 'icon': 'assets/icons/all.png'},
    {'name': 'Ambient', 'icon': 'assets/icons/ambient.png'},
    {'name': 'For Kids', 'icon': 'assets/icons/forkids.png'},
  ];

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          bool isSelected =
              category['name'] == categoryProvider.selectedCategory;
          return GestureDetector(
            onTap: () {
              categoryProvider.setCategory(category['name']!);
              onCategorySelected(category['name']!);
            },
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              padding: const EdgeInsets.all(8.0),
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
                      fontFamily: 'SF',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
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
