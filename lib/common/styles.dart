import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color backgroundColor = Colors.grey.shade100;
Color backgroundDarkModeColor = const Color(0xff233441);
Color shadow1DarkModeColor = const Color(0xff32414c);
Color shadow2DarkModeColor = const Color(0xff1b2630);
Color blueColor = const Color(0xff0effee);
Color redColor = const Color(0xffff555c);
Color blackColor = const Color(0xff233441);
Color whiteColor = const Color(0xffffffff);
Color greyColor = const Color(0xff7c858d);
Color purpleColor = const Color(0xFF6B38FB);

final TextStyle textStyle = GoogleFonts.libreFranklin();
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
  return ThemeData.light().copyWith(
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Colors.black,
          onPrimary: Colors.black,
          secondary: purpleColor,
        ),
    scaffoldBackgroundColor: backgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: myTextTheme,
    appBarTheme:
        AppBarTheme(elevation: 0, color: backgroundColor, centerTitle: true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: purpleColor,
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
      color: purpleColor,
    ),
  );
}

ThemeData getDarkModeTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    colorScheme: Theme.of(context).colorScheme.copyWith(),
    scaffoldBackgroundColor: backgroundDarkModeColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: myTextTheme,
    appBarTheme: AppBarTheme(
      elevation: 1,
      color: backgroundDarkModeColor,
      foregroundColor: whiteColor,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: purpleColor,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(color: Colors.black),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(0),
          ),
        ),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: blueColor,
    ),
  );
}

CupertinoThemeData getIosTheme(BuildContext context) {
  return CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: purpleColor,
    primaryContrastingColor: CupertinoColors.black,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: CupertinoTextThemeData(
      primaryColor: purpleColor,
      textStyle: myTextTheme.bodyLarge?.copyWith(
        color: CupertinoColors.activeBlue,
      ),
    ),
  );
}

CupertinoThemeData getIosDarkTheme(BuildContext context) {
  return CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: blueColor,
    primaryContrastingColor: CupertinoColors.black,
    scaffoldBackgroundColor: backgroundDarkModeColor,
    textTheme: CupertinoTextThemeData(
      primaryColor: blueColor,
      textStyle: myTextTheme.bodyLarge?.copyWith(
        color: CupertinoColors.activeBlue,
      ),
    ),
  );
}
