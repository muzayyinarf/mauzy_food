import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color primaryColor = Colors.grey.shade100;
const Color secondaryColor = Color(0xFF6B38FB);

final TextTheme myTextTheme = TextTheme(
  displayLarge: GoogleFonts.merriweather(
      fontSize: 92, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  displayMedium: GoogleFonts.merriweather(
      fontSize: 57, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  displaySmall:
      GoogleFonts.merriweather(fontSize: 46, fontWeight: FontWeight.w400),
  headlineMedium: GoogleFonts.merriweather(
      fontSize: 32, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headlineSmall:
      GoogleFonts.merriweather(fontSize: 23, fontWeight: FontWeight.w400),
  titleLarge: GoogleFonts.merriweather(
      fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  titleMedium: GoogleFonts.merriweather(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  titleSmall: GoogleFonts.merriweather(
      fontSize: 13, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyLarge: GoogleFonts.libreFranklin(
      fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyMedium: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  labelLarge: GoogleFonts.libreFranklin(
      fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  bodySmall: GoogleFonts.libreFranklin(
      fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  labelSmall: GoogleFonts.libreFranklin(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

ThemeData getAndroidTheme(BuildContext context) {
  return ThemeData(
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Colors.black,
          onPrimary: Colors.black,
          secondary: secondaryColor,
        ),
    scaffoldBackgroundColor: primaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: myTextTheme,
    appBarTheme: const AppBarTheme(elevation: 0),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: secondaryColor,
        foregroundColor: Colors.white,
        textStyle: const TextStyle(color: Colors.black),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0),
          ),
        ),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: Colors.grey.shade700,
    ),
  );
}

CupertinoThemeData getIosTheme(BuildContext context) {
  return CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: secondaryColor,
    primaryContrastingColor: CupertinoColors.black,
    scaffoldBackgroundColor: primaryColor,
    textTheme: CupertinoTextThemeData(
      primaryColor: secondaryColor,
      textStyle: myTextTheme.bodyLarge?.copyWith(
        color: CupertinoColors.activeBlue,
      ),
    ),
  );
}
