import 'package:flutter/material.dart';

import 'pages/landing_page/landing_page.dart';
import 'resources/themes.dart';

void main() {
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
