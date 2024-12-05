import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/launch/provider/launch_provider.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LaunchProvider>().initiateLaunch(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff141927),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image scales dynamically based on screen size
            Image.asset(
              'assets/images/launch_icon.png',
              width: screenWidth * 0.4,
              height: screenHeight * 0.2,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            // Text scales dynamically based on screen width
            Text(
              'Sleep Sounds',
              style: TextStyle(
                fontFamily: 'SF',
                fontWeight: FontWeight.w700,
                fontSize: screenWidth * 0.08,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
