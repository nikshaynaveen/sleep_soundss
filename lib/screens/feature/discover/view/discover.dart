import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/category_tab.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/category_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/widgets/test_grid_pack.dart';

class Discover extends StatelessWidget {
  const Discover({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff141927),
      appBar: AppBar(
        backgroundColor: const Color(0xff141927),
        title: const Text(
          'Discover',
          style: TextStyle(
            fontFamily: 'SF',
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CategoryTabs
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CategoryTabs(
              onCategorySelected: (category) =>
                  categoryProvider.setCategory(category),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          // MusicGrid
          Expanded(
            child: TestGridPack(
              selectedCategory: categoryProvider.selectedCategory,
            ),
          ),
        ],
      ),
    );
  }
}
