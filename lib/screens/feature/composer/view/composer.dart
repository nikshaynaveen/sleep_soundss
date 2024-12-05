import 'package:flutter/material.dart';
import 'package:sleep_sounds/utilities/images_path.dart';
import 'package:sleep_sounds/screens/feature/composer/widgets/section_widgets.dart';

class Composer extends StatelessWidget {
  const Composer({super.key});

  @override
  Widget build(BuildContext context) {
    // Fetch screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor:
          const Color(0xff141927), // Background color for the screen
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "Composer",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 34, // Responsive font size
                    fontWeight: FontWeight.w700,
                    fontFamily: 'SF',
                  ),
                ),
                SizedBox(height: screenHeight * 0.04), // Responsive spacing

                // Child Section
                SectionWidget(
                  title: "Child",
                  subtitle: "Quickly stabilize your baby's emotions",
                  buttons: [
                    ButtonData(
                        iconPath: femaleVoicePng,
                        label: "Female Voice"),
                    ButtonData(
                        iconPath: whiteNoizPng,
                        label: "White Noise"),
                    ButtonData(
                        iconPath:lullabyPng, label: "Lullaby"),
                    ButtonData(
                        iconPath:lullabyPng, label: "Lullaby"),
                  ],
                  buttonColor: Colors.blue,
                  buttonSize: screenWidth * 0.25, // Dynamic button size
                ),

                // Nature Section
                SectionWidget(
                  title: "Nature",
                  subtitle: "It will allow you to merge with nature",
                  buttons: [
                    ButtonData(
                        iconPath: rainPng, label: "Rain"),
                    ButtonData(
                        iconPath:forestPng, label: "Forest"),
                    ButtonData(
                        iconPath: oceanPng, label: "Ocean"),
                  ],
                  buttonColor: Colors.green,
                  buttonSize: screenWidth * 0.25,
                ),

                // Animals Section
                SectionWidget(
                  title: "Animals",
                  subtitle: "Animal voices will improve your sleep",
                  buttons: [
                    ButtonData(
                        iconPath: birdPng, label: "Bird"),
                    ButtonData(iconPath: catPng, label: "Cat"),
                    ButtonData(iconPath: catPng, label: "Frog"),
                  ],
                  buttonColor: Colors.orange,
                  buttonSize: screenWidth * 0.25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonData {
  final String iconPath;
  final String label;

  ButtonData({required this.iconPath, required this.label});
}
