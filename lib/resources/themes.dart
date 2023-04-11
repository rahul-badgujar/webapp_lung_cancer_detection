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
      textTheme: GoogleFonts.courierPrimeTextTheme(),
      appBarTheme: defaultAppBarTheme,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: GoogleFonts.courierPrime(),
        ),
      ),
      inputDecorationTheme: inputDecorationTheme(),
    );
  }

  static InputDecorationTheme inputDecorationTheme() {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.black),
      gapPadding: 10,
    );
    return InputDecorationTheme(
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      // if we are define our floatingLabelBehavior in our theme then it's not applayed
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
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
