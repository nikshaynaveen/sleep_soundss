import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/launch/provider/launch_provider.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LaunchProvider>().initiateLaunch(context);

    return Scaffold(
      backgroundColor: const Color(0xff141927),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/launch_icon.png'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Sleep Sounds',
              style: TextStyle(
                fontFamily: 'SF',
                fontWeight: FontWeight.w700,
                fontSize: 34,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
