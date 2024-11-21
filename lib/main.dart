import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sleep_sounds/screens/launch_screen.dart';
import 'package:sleep_sounds/screens/onboarding_screen.dart';
import 'package:sleep_sounds/screens/sleep.dart';
import 'package:sleep_sounds/providers/auth_provider.dart';
import 'package:sleep_sounds/providers/favorite_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
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
        '/onboarding': (context) => OnboardingScreen(),
        '/sleep': (context) => const Sleep(),
      },
    );
  }
}
