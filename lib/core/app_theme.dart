import 'package:flutter/material.dart';

class AppTheme {
  static Color primary = const Color(0xFF39A552);
  static Color navy = const Color(0xff4F5A69);
  static Color black = const Color(0xff303030);
  static Color white = const Color(0xffFFFFFF);

  static ThemeData light = ThemeData(
    primaryColor: primary,
    appBarTheme: AppBarTheme(
      backgroundColor: primary,
      elevation: 0,
      centerTitle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w400,
        color: white,
        fontSize: 22,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.w400,
        color: white,
        fontSize: 22,
      ),
      bodyMedium: TextStyle(
        fontWeight: FontWeight.w700,
        color: navy,
        fontSize: 22,
      ),
      bodySmall: TextStyle(
        fontWeight: FontWeight.w400,
        color: black,
        fontSize: 14,
      ),
      bodyLarge: TextStyle(
        fontWeight: FontWeight.w700,
        color: black,
        fontSize: 24,
      ),
    ),
  );
}
