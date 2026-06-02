import 'package:flutter/material.dart';
import 'package:news_app/core/data_source/local_data/preference_manager.dart';
import 'package:news_app/core/them/light_them.dart';
import 'package:news_app/features/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize the preferences manager
  await PreferencesManager().init();
  // PreferencesManager().clear(); // Clear all saved preferences (for testing purposes)
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightThem,

      home: SplashScreen(), //SplashScreen(),
    );
  }
}
