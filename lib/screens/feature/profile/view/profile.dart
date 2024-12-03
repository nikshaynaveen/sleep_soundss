import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoggedIn = true; // Manages the login state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141927),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SF',
                ),
              ),
              const SizedBox(height: 20),
              _buildAuthorizationSection(),
              const SizedBox(height: 20),
              _buildOptionsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthorizationSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff2D344B),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(
            isLoggedIn ? 'assets/icons/logout.png' : 'assets/icons/login.png',
            height: 60,
            width: 60,
          ),
          const SizedBox(height: 10),
          Text(
            isLoggedIn ? 'First name Last name' : 'Authorization',
            style: const TextStyle(
              fontFamily: 'SF',
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            isLoggedIn
                ? 'Log in with Apple ID \n  email@gmail.com'
                : 'In order to access the library of favorite packs of sounds,Log in with Apple ID',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontFamily: 'SF',
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              if (isLoggedIn) {
                _showLogoutBottomSheet();
              } else {
                setState(() {
                  isLoggedIn = true; // Login action
                });
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff2D344B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              minimumSize: const Size(300, 50),
            ),
            child: isLoggedIn
                ? const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: 18,
                      fontFamily: 'SF',
                    ),
                  )
                : const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.apple, color: Colors.white),
                      SizedBox(width: 8),
                      Text(
                        'Login with Apple ID',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontFamily: 'SF',
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionsSection() {
    return Expanded(
      child: ListView(
        children: [
          _buildListTile(
            'assets/icons/get_premium.png',
            'Get Premium',
            Colors.orange,
            trailingColor: Colors.orange,
          ),
          if (isLoggedIn)
            _buildListTile(
              'assets/icons/favorite.png',
              'Favorite',
              Colors.white,
              onTap: () {
                // Navigate to the Favorite Screen
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const favoriteScreen(),
                //   ),
                // );
              },
            ),
          _buildListTile(
            'assets/icons/privacy_policy.png',
            'Privacy Policy',
            null,
          ),
          _buildListTile(
            'assets/icons/licence_agreement.png',
            'License Agreement',
            null,
          ),
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
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: const Color.fromARGB(0, 94, 70, 70),
        child: Image.asset(imagePath, fit: BoxFit.contain),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'SF',
          color: textColor ?? Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing:
          Icon(Icons.arrow_forward_ios, color: trailingColor ?? Colors.grey),
      onTap: onTap ?? () {}, // Ensure onTap is being used
    );
  }

  void _showLogoutBottomSheet() {
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(0, 45, 52, 75),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isLoggedIn = false; // Perform logout action
                  });
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2D344B),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  minimumSize: const Size(double.infinity, 100),
                ),
                child: const Column(
                  children: [
                    Text(
                      'Are you sure you want to go out',
                      style: TextStyle(
                          fontFamily: 'SF',
                          color: Color.fromARGB(241, 247, 249, 247),
                          fontSize: 16),
                    ),
                    Divider(
                      color: Color.fromARGB(
                          255, 121, 119, 119), // Color of the divider
                      thickness: 1, // Thickness of the line
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontFamily: 'SF',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the bottom sheet
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  minimumSize: const Size(500, 60),
                  backgroundColor: const Color(0xff2D344B),
                ),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    fontFamily: 'SF',
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
