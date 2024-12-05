import 'package:flutter/material.dart';
import 'package:sleep_sounds/screens/common_widgets/images_path.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff141927),
      body: SafeArea(
        child: Column(
          children: [
            // AppBar
            Padding(
              padding: EdgeInsets.only(
                // 2% of screen height
                left: screenWidth * 0.03, // 3% of screen width
                right: screenWidth * 0.03,
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios,
                        color: Color(0xff4870FF)),
                    iconSize: screenWidth * 0.07, // 7% of screen width
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  SizedBox(width: screenWidth * 0.02), // 2% of screen width
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontFamily: 'SF',
                      fontSize: screenWidth * 0.045, // Dynamic font size
                      color: const Color(0xff4870FF),
                    ),
                  ),
                  const Spacer(), // Pushes the text to the center
                  Text(
                    'Favorite',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'SF',
                      fontSize: screenWidth * 0.045, // Dynamic font size
                      color: const Color(0xffFFFFFF),
                    ),
                  ),
                  const Spacer(
                      flex: 2), // Additional spacing for proper alignment
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.3), // Spacer below AppBar

            // Empty Favorite Section
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  favoritePng,
                  width: screenWidth * 0.3, // 50% of screen width
                  height: screenHeight * 0.1, // 30% of screen height
                  fit: BoxFit.contain,
                ),
                SizedBox(height: screenHeight * 0.03), // 3% of screen height
                Text(
                  'Favorite is empty',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF',
                    fontSize: screenWidth * 0.05, // Dynamic font size
                    color: const Color(0xffFFFFFF),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01), // 1% of screen height
                Text(
                  'Your favorite packs will be stored here',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'SF',
                    fontSize: screenWidth * 0.035, // Dynamic font size
                    color: const Color.fromARGB(255, 201, 201, 205),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
