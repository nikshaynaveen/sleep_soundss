// lib/consts/font_widgets.dart

import 'package:flutter/material.dart';

// Define a class for reusable text styles
class FontConstants {
  // Define font families
  static const String nunito = 'Nunito';

  // Define text styles for Nunito-Black and Nunito-Light
  static const TextStyle nunitoBlack = TextStyle(
    fontFamily: nunito,
    fontWeight: FontWeight.w900, // For Nunito-Black
  );

  static const TextStyle nunitoLight = TextStyle(
    fontFamily: nunito,
    fontWeight: FontWeight.w300, // For Nunito-Light
  );
}

// Define a custom widget for Nunito-Black text style
class NunitoBlackText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  const NunitoBlackText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FontConstants.nunitoBlack.copyWith(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 16.0,
      ),
    );
  }
}

// Define a custom widget for Nunito-Light text style
class NunitoLightText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;

  const NunitoLightText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FontConstants.nunitoLight.copyWith(
        color: color ?? Colors.black,
        fontSize: fontSize ?? 16.0,
      ),
    );
  }
}
