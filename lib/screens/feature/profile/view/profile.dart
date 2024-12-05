import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/common_widgets/images_path.dart';
import 'package:sleep_sounds/screens/feature/profile/view/favorite.dart';
import 'package:sleep_sounds/screens/feature/profile/provider/profile_provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xff141927),
      body: SafeArea(
        child: ListView(children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, // 5% horizontal padding
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "  Profile",
                  style: TextStyle(
                    color: Color(0xffFFFFFF),
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'SF',
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // 3% height
                _buildAuthorizationSection(
                    context, profileProvider, screenWidth, screenHeight),
                SizedBox(height: screenHeight * 0.03),
                _buildOptionsSection(
                    context, profileProvider, screenWidth, screenHeight),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildAuthorizationSection(
      BuildContext context,
      ProfileProvider profileProvider,
      double screenWidth,
      double screenHeight) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Container(
          height: size.width > 750 ? 670 : null,
          decoration: BoxDecoration(
            color: const Color(0xff2D344B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Adjust content dynamically
              children: [
                Image.asset(
                  profileProvider.isLoggedIn ? logoutPng : loginPng,
                  // height: screenWidth * 0.15, // 15% of screen width
                  // width: screenWidth * 0.15,
                ),
                Text(
                  profileProvider.isLoggedIn
                      ? 'First name Last name'
                      : 'Authorization',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenWidth * 0.01),
                Text(
                  profileProvider.isLoggedIn
                      ? 'Log in with Apple ID \n email@gmail.com'
                      : 'In order to access the library of favorite packs of sounds, log in with Apple ID',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                SizedBox(height: screenWidth * 0.05),
                GestureDetector(
                  onTap: () {
                    if (profileProvider.isLoggedIn) {
                      _showLogoutBottomSheet(
                          context, profileProvider, screenHeight);
                    } else {
                      profileProvider.toggleLoginStatus();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: profileProvider.isLoggedIn
                          ? const Color(0xff2D344B)
                          : const Color(0xff141927),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    width: screenWidth * 0.7, // 80% of screen width
                    height: screenWidth * 0.12, // Proportional height
                    alignment: Alignment.center,
                    child: profileProvider.isLoggedIn
                        ? const Text(
                            'Logout',
                            style:
                                TextStyle(color: Colors.orange, fontSize: 17),
                          )
                        : const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.apple, color: Colors.white),
                              SizedBox(width: 8),
                              Text(
                                'Login with Apple ID',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 17),
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionsSection(
      BuildContext context,
      ProfileProvider profileProvider,
      double screenWidth,
      double screenHeight) {
    return SizedBox(
      height: screenHeight * 0.5, // Constrain height dynamically
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 10),
          const Divider(color: Color(0xFF21283F), thickness: 1),
          _buildListTile(
            getPremiumPng,
            'Get Premium',
            Colors.orange,
            trailingColor: Colors.orange,
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF21283F), thickness: 1),
          if (profileProvider.isLoggedIn)
            _buildListTile(
              favoritestarpng,
              'Favorite',
              Colors.white,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoriteScreen(),
                  ),
                );
              },
            ),
          _buildListTile(
            privacypolicyPng,
            'Private Policy',
            null,
          ),
          _buildListTile(
            licenceagreementPng,
            'License Agreement',
            null,
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF21283F), thickness: 1),
          _buildListTile(
            rateusPng,
            'Rate Us',
            null,
          ),
          _buildListTile(
            sendfeedbackPng,
            'Send Feedback',
            null,
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF21283F), thickness: 1),
        ],
      ),
    );
  }

  Widget _buildListTile(
    String imagePath,
    String title,
    Color? textColor, {
    Color? trailingColor,
    VoidCallback? onTap,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: Colors.transparent,
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: 'SF',
              color: textColor ?? Colors.white,
              fontSize: 17,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: trailingColor ?? Colors.grey,
          ),
          onTap: onTap ?? () {},
        ),
        const Divider(
          color: Color(0xFF21283F),
          thickness: 1,
          height: 1,
        ),
      ],
    );
  }

  void _showLogoutBottomSheet(
      BuildContext context, ProfileProvider provider, double screenHeight) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(0, 199, 184, 184),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  provider.toggleLoginStatus();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff141927),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(double.infinity, screenHeight * 0.15),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Are you sure you want to log out?',
                      style: TextStyle(
                        color: Color(0xffEBEBF5),
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(color: Color(0xFF21283F), thickness: 1),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Color(0xff4870FF),
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0xff2D344B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: Size(double.infinity, screenHeight * 0.07),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
