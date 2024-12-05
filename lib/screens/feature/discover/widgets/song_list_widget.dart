import 'package:flutter/material.dart';

class SongListWidget extends StatelessWidget {
  final List<Map<String, String>> songs;

  const SongListWidget({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Calculate the height based on the number of songs and screen height
    double itemHeight =
        screenHeight * 0.07; // Adjusted height for each song item
    double containerHeight =
        songs.length * itemHeight; // Total height for the container

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: Color(0xff21283f),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'LIST OF SONGS',
              style: TextStyle(
                color: Color(0XFF9a9dac),
                fontFamily: 'SF',
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              height: containerHeight, // Set dynamic height
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: screenHeight *
                                0.01), // Responsive padding for each item
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right:
                                      screenWidth * 0.04), // Responsive padding
                              child: Text(
                                (index + 1).toString().padLeft(2, '0'),
                                style: TextStyle(
                                  color: const Color(0XFF9a9dac),
                                  fontFamily: 'SF',
                                  fontSize: screenWidth *
                                      0.035, // Responsive font size
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff181d2e),
                                shape: BoxShape.circle,
                              ),
                              padding: EdgeInsets.all(
                                  screenWidth * 0.02), // Responsive icon size
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size:
                                    screenWidth * 0.04, // Responsive icon size
                              ),
                            ),
                            SizedBox(
                                width:
                                    screenWidth * 0.04), // Responsive spacing
                            Expanded(
                              child: Text(
                                song['title'] ?? 'Unknown',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth *
                                      0.045, // Responsive font size
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'SF',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (index < songs.length - 1)
                        const Divider(
                          color: Color(0XFF2D344B),
                          thickness: 1,
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
