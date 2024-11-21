import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final Color? iconcolor;

  const CustomButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.color,
      this.onPressed,
      this.textStyle,
      this.iconcolor = Colors.white});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 166,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, color: iconcolor),
        label: Text(
          label,
          style: textStyle ??
              const TextStyle(
                color: Colors.white,
                fontFamily: 'Nunito',
              ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
