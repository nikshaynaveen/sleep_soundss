import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/composer/widgets/button.dart';

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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "Composer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
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

class SectionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<ButtonData> buttons;
  final Color buttonColor;

  const SectionWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttons,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    // Initialize button states for this section
    final buttonState = Provider.of<ButtonState>(context, listen: false);
    buttonState.initializeSection(title, buttons.length);

    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.w400,
              fontFamily: 'SF',
            ),
          ),
          const SizedBox(height: 5),

          // Section Subtitle
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: 'SF',
            ),
          ),
          const SizedBox(height: 10),

          // Buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: buttons.asMap().entries.map((entry) {
                int index = entry.key;
                ButtonData button = entry.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      buttonState.toggleButton(title, index);
                    },
                    child: Consumer<ButtonState>(
                      builder: (context, state, child) {
                        bool isClicked = state.getButtonState(title, index);

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 100,
                              height: 70,
                              decoration: BoxDecoration(
                                color: isClicked
                                    ? buttonColor
                                    : const Color(0xff1d2339),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                children: [
                                  Image.asset(
                                    button.iconPath,
                                    width: 36,
                                    height: 36,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 40,
                              decoration: const BoxDecoration(
                                color: Color(0xFF2D344B),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(12),
                                    bottomRight: Radius.circular(12)),
                              ),
                              child: Center(
                                child: Text(
                                  button.label,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
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

// class SectionWidget extends StatefulWidget {
//   final String title;
//   final String subtitle;
//   final List<ButtonData> buttons;
//   final Color buttonColor; // Define the button color for each section

//   const SectionWidget({
//     super.key,
//     required this.title,
//     required this.subtitle,
//     required this.buttons,
//     required this.buttonColor,
//   });

//   @override
//   _SectionWidgetState createState() => _SectionWidgetState();
// }

// class _SectionWidgetState extends State<SectionWidget> {
//   // Tracks the clicked state of each button
//   final List<bool> _buttonClicked = [];

//   @override
//   void initState() {
//     super.initState();
//     _buttonClicked.addAll(List.filled(widget.buttons.length, false));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 20),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Section Title
//           Text(
//             widget.title,
//             style: const TextStyle(
//               color: Colors.white,
//               fontSize: 22,
//               fontWeight: FontWeight.w500,
//               fontFamily: 'SF',
//             ),
//           ),
//           const SizedBox(height: 5),

//           // Section Subtitle
//           ConstrainedBox(
//             constraints: const BoxConstraints(
//               maxHeight: 80, // Max height to prevent the container from growing
//             ),
//             child: Text(
//               widget.subtitle,
//               overflow: TextOverflow.ellipsis, // Text overflow if it's too long
//               style: const TextStyle(
//                 color: Colors.grey,
//                 fontSize: 16,
//                 fontFamily: 'SF',
//               ),
//             ),
//           ),
//           const SizedBox(height: 10),

//           // Row of Buttons inside a scrollable view
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: widget.buttons.asMap().entries.map((entry) {
//                 int index = entry.key;
//                 ButtonData button = entry.value;

//                 return Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Container wrapping both the ElevatedButton and the label
//                       Container(
//                         padding: const EdgeInsets.symmetric(vertical: 0),
//                         decoration: BoxDecoration(
//                           color: const Color(0xff1d2339),
//                           // color: const Color.fromARGB(255, 25, 207,
//                           // 58), // Background color of the container
//                           borderRadius:
//                               BorderRadius.circular(12), // Border radius
//                         ),
//                         child: Column(
//                           children: [
//                             // Elevated Button with Image
//                             GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   // Toggle button clicked state
//                                   _buttonClicked[index] =
//                                       !_buttonClicked[index];
//                                 });
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   color: _buttonClicked[index]
//                                       ? widget
//                                           .buttonColor // Change color if clicked
//                                       : const Color(
//                                           0xff1d2339), // Default color
//                                   borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(12),
//                                     topRight: Radius.circular(12),
//                                   ),
//                                 ),
//                                 padding: const EdgeInsets.all(12),
//                                 width: 100, // Fixed width
//                                 height: 90, // Fixed height
//                                 child: Image.asset(
//                                   button.iconPath,
//                                   width: 36,
//                                   height: 36,
//                                 ),
//                               ),
//                             ),

//                             // const SizedBox(height: 5),

//                             // Label in a separate container
//                             Container(
//                               width: 100, // Fixed width
//                               height: 40,
//                               decoration: const BoxDecoration(
//                                 borderRadius: BorderRadius.only(
//                                   bottomLeft: Radius.circular(12),
//                                   bottomRight: Radius.circular(12),
//                                 ),
//                                 color: Color(0xFF2D344B),
//                               ),

//                               padding: const EdgeInsets.symmetric(vertical: 8),
//                               child: Text(
//                                 button.label,
//                                 style: const TextStyle(
//                                   fontFamily: 'SF',
//                                   color: Colors.white,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// Button Data Model
class ButtonData {
  final String iconPath;
  final String label;

  ButtonData({required this.iconPath, required this.label});
}
