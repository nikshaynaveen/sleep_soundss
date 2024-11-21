import 'package:flutter/material.dart';

class Music extends StatelessWidget {
  const Music({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141927),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff141927),
        title: const Text(
          'Music',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Center(
        child: Text(
          'Music Content Goes Here',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontFamily: 'Nunito',
          ),
        ),
      ),
    );
  }
}
