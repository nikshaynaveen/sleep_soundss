import 'package:flutter/material.dart';

class Composer extends StatelessWidget {
  const Composer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141927),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff141927),
        title: const Text(
          'Composer',
          style: TextStyle(
            fontFamily: 'SF',
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Composer Content Goes Here',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'SF',
          ),
        ),
      ),
    );
  }
}
