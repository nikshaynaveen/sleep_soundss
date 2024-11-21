import 'package:flutter/material.dart';
import 'package:sleep_sounds/widgets/category_tab.dart';
import 'package:sleep_sounds/widgets/music_grid.dart'; // Import the new widget

class Sleep extends StatefulWidget {
  const Sleep({super.key});

  @override
  _SleepState createState() => _SleepState();
}

class _SleepState extends State<Sleep> {
  String _selectedCategory = 'All';

  void _onCategorySelected(String category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141927),
      appBar: AppBar(
        backgroundColor: const Color(0xff141927),
        title: const Text(
          'Sleep',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 24,
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
              onCategorySelected: _onCategorySelected,
            ),
          ),
          // MusicGrid
          Expanded(
            child: MusicGrid(
              selectedCategory: _selectedCategory,
            ),
          ),
        ],
      ),
    );
  }
}
