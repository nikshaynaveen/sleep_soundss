import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/composer/view/composer.dart';
import 'package:sleep_sounds/screens/feature/composer/widgets/button.dart';

class SectionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final List<ButtonData> buttons;
  final Color buttonColor;
  final double buttonSize; // New parameter for button size

  const SectionWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttons,
    required this.buttonColor,
    required this.buttonSize,
  });

  @override
  Widget build(BuildContext context) {
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
              color: Color(0xffFFFFFF),
              fontSize: 17, // Adjust title size dynamically
              fontWeight: FontWeight.w400,
              fontFamily: 'SF',
            ),
          ),
          const SizedBox(height: 5),

          // Section Subtitle
          Text(
            subtitle,
            style: const TextStyle(
              color: Color.fromARGB(127, 235, 235, 245),
              fontSize: 12, // Adjust subtitle size dynamically
              fontWeight: FontWeight.w400,
              fontFamily: 'SF',
            ),
          ),
          const SizedBox(height: 10),

          // Buttons
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              children: buttons.asMap().entries.map((entry) {
                int index = entry.key;
                ButtonData button = entry.value;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                              height: 90,
                              decoration: BoxDecoration(
                                color: isClicked
                                    ? buttonColor
                                    : const Color(0xff1d2339),
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Image.asset(
                                button.iconPath,
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 35,
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
