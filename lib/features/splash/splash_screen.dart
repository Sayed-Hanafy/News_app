import 'package:flutter/material.dart';
import 'package:news_app/core/data_source/local_data/preference_manager.dart';
import 'package:news_app/features/home/home_screen.dart';
import 'package:news_app/features/auth/login_screen.dart';
import 'package:news_app/features/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // PreferencesManager().clear(); // Clear all saved preferences (for testing purposes)
    _navigateAfterSplash();
  }

  void _navigateAfterSplash() async {
    await Future.delayed(const Duration(seconds: 1));
    final bool isOnboardingScreen =
        PreferencesManager().getBool('key_onboarding_screen') ?? false;
    final bool isLoggedInScreen =
        PreferencesManager().getBool('key_logged_in_screen') ?? false;

    if (!mounted) return;
    if (!isOnboardingScreen) {
      Navigator.pushReplacement(
        context,
        (MaterialPageRoute(builder: (context) => OnBoardingScreen())),
      );
    } else if (!isLoggedInScreen) {
      Navigator.pushReplacement(
        context,
        (MaterialPageRoute(builder: (context) => LoginScreen())),
      );
    } else {
      Navigator.pushReplacement(
        context,
        (MaterialPageRoute(builder: (context) => HomeScreen())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset('assets/images/splash.png', width: double.infinity),
    );
  }
}
