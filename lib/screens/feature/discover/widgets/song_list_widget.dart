import 'package:flutter/material.dart';

class SongListWidget extends StatelessWidget {
  final List<Map<String, String>> songs;

  const SongListWidget({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    // Calculate the height based on the number of songs
    double itemHeight =
        58.0; // Height for each song item (you can adjust this value)
    double containerHeight =
        songs.length * itemHeight; // Total height for the container

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        color: Color(0xff21283f),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
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
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Text(
                                (index + 1).toString().padLeft(2, '0'),
                                style: const TextStyle(
                                  color: Color(0XFF9a9dac),
                                  fontFamily: 'SF',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff181d2e),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(5),
                              child: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Text(
                                song['title'] ?? 'Unknown',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
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
