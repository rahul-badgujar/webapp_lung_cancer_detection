import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors_pallet.dart';

class Themes {
  static ThemeData get primaryLightTheme {
    return ThemeData(
      primarySwatch: ColorPalette.primarySwatch,
      primaryColor: ColorPalette.primaryColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: ColorPalette.scaffoldBgColor,
      textTheme: GoogleFonts.latoTextTheme().copyWith(),
      appBarTheme: defaultAppBarTheme,
    );
  }

  static AppBarTheme get defaultAppBarTheme {
    return const AppBarTheme(
      elevation: 0,
    );
  }

  static AppBarTheme get lightAppBarTheme {
    return defaultAppBarTheme.copyWith(
      backgroundColor: ColorPalette.scaffoldBgColor,
      foregroundColor: ColorPalette.textDarkShade(3),
    );
  }
}
