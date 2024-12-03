import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/bottom_container_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/category_provider.dart';
import 'package:sleep_sounds/screens/feature/launch/provider/launch_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/navigation_provider.dart';
import 'package:sleep_sounds/screens/feature/launch/view/launch.dart';
import 'package:sleep_sounds/screens/feature/launch/view/login_slides.dart';
import 'package:sleep_sounds/screens/feature/discover/view/discover.dart';
import 'package:sleep_sounds/screens/feature/launch/provider/auth_provider.dart';
import 'package:sleep_sounds/screens/feature/discover/provider/favorite_provider.dart';
import 'package:sleep_sounds/screens/feature/profile/provider/profile_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => LaunchProvider()),
        ChangeNotifierProvider(create: (_) => BottomContainerProvider()),
        ChangeNotifierProvider(create: (_) => ProfileProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sleep Sounds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LaunchScreen(),
      routes: {
        '/loginslides': (context) => LoginSlides(),
        '/sleep': (context) => const Discover(),
      },
    );
  }
}
