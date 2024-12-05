import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/category_provider.dart';
import 'package:sleep_sounds/utilities/images_path.dart';

class CategoryTabs extends StatelessWidget {
  final Function(String) onCategorySelected;

  CategoryTabs({required this.onCategorySelected, super.key});

  final List<Map<String, String>> categories = [
    {'name': 'All', 'icon': allPng},
    {'name': 'Ambient', 'icon': ambientPng},
    {'name': 'For Kids', 'icon': forkidsPng},
  ];

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    // Get screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
              margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.04,
                vertical: screenHeight * 0.01,
              ),
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
                    width: screenWidth * 0.045,
                    height: screenWidth * 0.045,
                  ),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    category['name']!,
                    style: TextStyle(
                      fontFamily: 'SF',
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.04,
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
