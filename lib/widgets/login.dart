import 'package:flutter/material.dart';

class Login_Widget extends StatelessWidget {
  final Widget icon; // Change from IconData to Widget
  final String title;
  final String subtitle;

  const Login_Widget({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        icon, // Use the custom icon directly
        const SizedBox(height: 6),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'SF',
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'SF',
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
