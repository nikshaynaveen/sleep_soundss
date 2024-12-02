import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141927),
      body: Stack(
        children: [
          Column(
            children: [
              // AppBar
              Container(
                padding: const EdgeInsets.only(top: 40.0, left: 10.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Color(0xff4870FF), size: 30),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontFamily: 'SF',
                            fontSize: 22,
                            color: Color(0xff4870FF),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        const Text(
                          'Favorite',
                          style: TextStyle(
                            fontFamily: 'SF',
                            fontSize: 22,
                            color: Color(0xffFFFFFF),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                    Image.asset(
                      'assets/images/Favorite.png',
                    ),
                    const Center(
                      child: Text(
                        'Favorite is empty',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'SF',
                          fontSize: 17,
                          color: Color(0xffFFFFFF),
                        ),
                      ),
                    ),
                    const Text(
                      'Your favorite packs will be stored here',
                      style: TextStyle(
                        fontFamily: 'SF',
                        fontSize: 13,
                        color: Color.fromARGB(255, 201, 201, 205),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
