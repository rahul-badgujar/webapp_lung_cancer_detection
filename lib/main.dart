import 'package:flutter/material.dart';
import 'package:lung_cancer_detection_ui/pages/landing_page/landing_page.dart';
import 'resources/themes.dart';

Future<void> main() async {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes.primaryLightTheme,
      home: const LandingPage(),
    );
  }
}
