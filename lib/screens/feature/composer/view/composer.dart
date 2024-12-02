import 'package:flutter/material.dart';

class Composer extends StatelessWidget {
  const Composer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xff141927), // Background color for the screen
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "Composer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF',
                  ),
                ),
                const SizedBox(height: 20),

                // Child Section
                SectionWidget(
                  title: "Child",
                  subtitle: "Quickly stabilize your baby's emotions",
                  buttons: [
                    ButtonData(
                        iconPath: 'assets/icons/female_voice.png',
                        label: "Female Voice"),
                    ButtonData(
                        iconPath: 'assets/icons/white_noiz.png',
                        label: "White Noise"),
                    ButtonData(
                        iconPath: 'assets/icons/lullaby.png', label: "Lullaby"),
                    ButtonData(
                        iconPath: 'assets/icons/lullaby.png', label: "Lullaby"),
                  ],
                  buttonColor: Colors.blue, // Button color for "Child" section
                ),

                // Nature Section
                SectionWidget(
                  title: "Nature",
                  subtitle: "It will allow you to merge with nature",
                  buttons: [
                    ButtonData(
                        iconPath: 'assets/icons/rain.png', label: "Rain"),
                    ButtonData(
                        iconPath: 'assets/icons/forest.png', label: "Forest"),
                    ButtonData(
                        iconPath: 'assets/icons/ocean.png', label: "Ocean"),
                  ],
                  buttonColor:
                      Colors.green, // Button color for "Nature" section
                ),

                // Animals Section
                SectionWidget(
                  title: "Animals",
                  subtitle: "Animal voices will improve your sleep",
                  buttons: [
                    ButtonData(
                        iconPath: 'assets/icons/bird.png', label: "Bird"),
                    ButtonData(iconPath: 'assets/icons/cat.png', label: "Cat"),
                    ButtonData(iconPath: 'assets/icons/cat.png', label: "Frog"),
                  ],
                  buttonColor:
                      Colors.orange, // Button color for "Animals" section
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SectionWidget extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<ButtonData> buttons;
  final Color buttonColor; // Define the button color for each section

  const SectionWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttons,
    required this.buttonColor,
  });

  @override
  _SectionWidgetState createState() => _SectionWidgetState();
}

class _SectionWidgetState extends State<SectionWidget> {
  // Tracks the clicked state of each button
  final List<bool> _buttonClicked = [];

  @override
  void initState() {
    super.initState();
    _buttonClicked.addAll(List.filled(widget.buttons.length, false));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              fontFamily: 'SF',
            ),
          ),
          const SizedBox(height: 5),

          // Section Subtitle
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxHeight: 80, // Max height to prevent the container from growing
            ),
            child: Text(
              widget.subtitle,
              overflow: TextOverflow.ellipsis, // Text overflow if it's too long
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontFamily: 'SF',
              ),
            ),
          ),
          const SizedBox(height: 10),

          // Row of Buttons inside a scrollable view
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.buttons.asMap().entries.map((entry) {
                int index = entry.key;
                ButtonData button = entry.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    children: [
                      // Container wrapping both the ElevatedButton and the label
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(
                              0xff1d2339), // Background color of the container
                          borderRadius:
                              BorderRadius.circular(12), // Border radius
                        ),
                        child: Column(
                          children: [
                            // Elevated Button with Image
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: _buttonClicked[index]
                                    ? widget
                                        .buttonColor // Change color if clicked
                                    : const Color(0xff1d2339), // Default color
                                padding: const EdgeInsets.all(12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                fixedSize: const Size(
                                    120, 72), // Restored smaller size
                              ),
                              onPressed: () {
                                setState(() {
                                  // Toggle button clicked state
                                  _buttonClicked[index] =
                                      !_buttonClicked[index];
                                });
                              },
                              child: Image.asset(
                                button.iconPath,
                                width: 36,
                                height: 36,
                              ),
                            ),

                            const SizedBox(height: 5),

                            // Label in a separate container
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                button.label,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

// Button Data Model
class ButtonData {
  final String iconPath;
  final String label;

  ButtonData({required this.iconPath, required this.label});
}
