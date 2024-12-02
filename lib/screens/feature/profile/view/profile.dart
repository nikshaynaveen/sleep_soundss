import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/profile/view/favorite.dart';
import 'package:sleep_sounds/screens/feature/profile/provider/profile_provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<ProfileProvider>(context);

    return Scaffold(
      backgroundColor: const Color(0xff141927),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "  Profile",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: 'SF',
              ),
            ),
            const SizedBox(height: 20),
            _buildAuthorizationSection(context, profileProvider),
            const SizedBox(height: 20),
            _buildOptionsSection(context, profileProvider),
          ],
        ),
      ),
    );
  }

  Widget _buildAuthorizationSection(
      BuildContext context, ProfileProvider profileProvider) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xff2D344B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Image.asset(
                profileProvider.isLoggedIn
                    ? 'assets/icons/logout.png'
                    : 'assets/icons/login.png',
                height: 60,
                width: 60,
              ),
              const SizedBox(height: 10),
              Text(
                profileProvider.isLoggedIn
                    ? 'First name Last name'
                    : 'Authorization',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                profileProvider.isLoggedIn
                    ? 'Log in with Apple ID \n email@gmail.com'
                    : 'In order to access the library of favorite packs of sounds, log in with Apple ID',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  if (profileProvider.isLoggedIn) {
                    _showLogoutBottomSheet(context, profileProvider);
                  } else {
                    profileProvider.toggleLoginStatus();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: profileProvider.isLoggedIn
                        ? const Color(0xff2D344B) // Color when logged in
                        : const Color(0xff141927), // Color when logged out
                    borderRadius: BorderRadius.circular(25), // Rounded corners
                  ),
                  width: 300, // Fixed width
                  height: 50, // Fixed height
                  alignment: Alignment.center, // Center-align content
                  child: profileProvider.isLoggedIn
                      ? const Text(
                          'Logout',
                          style: TextStyle(color: Colors.orange, fontSize: 18),
                        )
                      : const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.apple, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              'Login with Apple ID',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                          ],
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionsSection(
      BuildContext context, ProfileProvider profileProvider) {
    return Expanded(
      child: ListView(
        children: [
          // Spacer before the first tile with underline
          const SizedBox(height: 10),
          const Divider(color: Color(0xFF21283F), thickness: 1),

          // First ListTile
          _buildListTile(
            'assets/icons/get_premium.png',
            'Get Premium',
            Colors.orange,
            trailingColor: Colors.orange,
          ),

          // Spacer after the first tile with underline
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF21283F), thickness: 1),

          // Next two ListTiles
          if (profileProvider.isLoggedIn)
            _buildListTile(
              'assets/icons/favorite.png',
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
            'assets/icons/privacy_policy.png',
            'Privacy Policy',
            null,
          ),

          // Last three ListTiles
          _buildListTile(
            'assets/icons/licence_agreement.png',
            'License Agreement',
            null,
          ),
          const SizedBox(height: 20),
          const Divider(color: Color(0xFF21283F), thickness: 1),
          _buildListTile(
            'assets/icons/rate_us.png',
            'Rate Us',
            null,
          ),

          _buildListTile(
            'assets/icons/send_feedback.png',
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
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios,
              color: trailingColor ?? Colors.grey),
          onTap: onTap ?? () {},
        ),
        const Divider(
          color: Color(0xFF21283F), // Color of the underline
          thickness: 1, // Thickness of the underline
          height: 1, // Height between the ListTile and the divider
        ),
      ],
    );
  }

  void _showLogoutBottomSheet(BuildContext context, ProfileProvider provider) {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xff2D344B),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  provider.toggleLoginStatus();
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2D344B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.orange, fontSize: 20),
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
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
