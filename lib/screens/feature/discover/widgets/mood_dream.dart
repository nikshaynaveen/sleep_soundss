import 'package:flutter/material.dart';

class MoodDream extends StatelessWidget {
  final Widget icon;
  final String title;
  final String subtitle;

  const MoodDream({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'SF',
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
