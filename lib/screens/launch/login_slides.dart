import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/home.dart';
import '../../providers/auth_provider.dart';

class LoginSlides extends StatelessWidget {
  final List<Map<String, String>> slides = [
    {
      'title': 'Exclusive Music',
      'description':
          'We have an author’s library of sounds that you will not find anywhere else',
      'image': 'assets/images/slide1.png',
    },
    {
      'title': 'Relax sleep sounds',
      'description':
          'Our sounds will help to relax and improve your sleep health',
      'image': 'assets/images/slide2.png',
    },
    {
      'title': 'Story for kids',
      'description':
          'Famous fairy tales with soothing sounds will help your children fall asleep faster',
      'image': 'assets/images/slide3.png',
    },
  ];

  LoginSlides({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xFF141927),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: PageView.builder(
              controller: authProvider.pageController,
              onPageChanged: (index) {
                authProvider.setSlide(index);
              },
              itemCount: slides.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(slides[index]['image']!),
                      const SizedBox(height: 30),
                      Text(
                        slides[index]['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF',
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        slides[index]['description']!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'SF',
                          color: Colors.white54,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          // Slide Indicator
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: index == authProvider.currentSlide
                        ? const Color(0xff4870ff)
                        : const Color(0xff21283f),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              if (authProvider.currentSlide < slides.length - 1) {
                authProvider.nextSlide();
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              fixedSize: const Size(440, 60),
              backgroundColor: const Color(0xFF21283F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: const Text(
              'Next',
              style: TextStyle(
                fontFamily: 'SF',
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
