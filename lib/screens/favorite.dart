import 'package:flutter/material.dart';

class favoriteScreen extends StatelessWidget {
  const favoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff141927),
        leading: IconButton(
          icon: const Icon(Icons.arrow_left, color: Colors.blue, size: 40),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          'Favorite',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              'Profile',
              style: TextStyle(color: Colors.blue, fontSize: 20),
            ),
          ),
        ],

        // title: const Text('Favorite'),
      ),
      backgroundColor: const Color(0xff141927),
      body: const Center(
        child: Text(
          "Favorite is empty,",
          style: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
