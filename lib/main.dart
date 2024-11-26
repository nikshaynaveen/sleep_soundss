import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/providers/bottom_container_provider.dart';
import 'package:sleep_sounds/providers/category_provider.dart';
import 'package:sleep_sounds/providers/launch_provider.dart';
import 'package:sleep_sounds/providers/navigation_provider.dart';
import 'package:sleep_sounds/screens/launch/launch.dart';
import 'package:sleep_sounds/screens/launch/login_slides.dart';
import 'package:sleep_sounds/screens/discover/discover.dart';
import 'package:sleep_sounds/providers/auth_provider.dart';
import 'package:sleep_sounds/providers/favorite_provider.dart';

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
