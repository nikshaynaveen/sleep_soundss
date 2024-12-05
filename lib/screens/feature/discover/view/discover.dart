import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/category_tab.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/category_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/music_pack_grid.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xff141927),
      appBar: AppBar(
        backgroundColor: const Color(0xff141927),
        title: Text(
          'Discover',
          style: TextStyle(
            fontFamily: 'SF',
            fontSize:
                screenWidth * 0.09, // Scaled font size based on screen width
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CategoryTabs
          Padding(
            padding: EdgeInsets.all(screenWidth * 0.02), // Scaled padding
            child: CategoryTabs(
              onCategorySelected: (category) =>
                  categoryProvider.setCategory(category),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01, // Scaled spacing
          ),
          // MusicGrid
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return MusicPackGrid(
                  selectedCategory: categoryProvider.selectedCategory,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
