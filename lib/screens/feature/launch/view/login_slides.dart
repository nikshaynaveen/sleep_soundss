import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/common_widgets/home_page.dart';
import 'package:sleep_sounds/utilities/images_path.dart';
import '../provider/auth_provider.dart';

class LoginSlides extends StatelessWidget {
  final List<Map<String, String>> slides = [
    {
      'title': 'Exclusive Music',
      'description':
          'We have an author’s library of sounds that you will not find anywhere else',
      'image': slide1Png,
    },
    {
      'title': 'Relax sleep sounds',
      'description':
          'Our sounds will help to relax and improve your sleep health',
      'image': slide2Png,
    },
    {
      'title': 'Story for kids',
      'description':
          'Famous fairy tales with soothing sounds will help your children fall asleep faster',
      'image': slide3Png,
    },
  ];

  LoginSlides({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFF141927),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.05),
          Expanded(
            child: PageView.builder(
              controller: authProvider.pageController,
              onPageChanged: (index) {
                authProvider.setSlide(index);
              },
              itemCount: slides.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        slides[index]['image']!,
                        width: screenWidth * 0.7,
                        height: screenHeight * 0.3,
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      Text(
                        slides[index]['title']!,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'SF',
                          fontSize: screenWidth * 0.085,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.015),
                      Text(
                        slides[index]['description']!,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'SF',
                          color: Colors.white54,
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Slide Indicator
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                slides.length,
                (index) => Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.015),
                  width: screenWidth * 0.025,
                  height: screenWidth * 0.025,
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
          SizedBox(height: screenHeight * 0.06),
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
              fixedSize: Size(screenWidth * 0.8, screenHeight * 0.06),
              backgroundColor: const Color(0xFF21283F),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            child: Text(
              authProvider.currentSlide == slides.length - 1
                  ? 'Start'
                  : 'Next', // Change button text conditionally
              style: TextStyle(
                fontFamily: 'SF',
                fontSize: screenWidth * 0.045,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.08),
        ],
      ),
    );
  }
}
