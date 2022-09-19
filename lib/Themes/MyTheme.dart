import 'package:flutter/material.dart';

class MyTheme {
  static final Color color = Color(0xFFB7935F);
  static final Color colordarkblue = Color(0xFF141A2E);
  static final Color coloryelow = Color(0xFFFACC1D);
  static final ThemeData lighttheme = ThemeData(
      backgroundColor: Colors.white,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white),
      primaryColor: color,
      scaffoldBackgroundColor: Colors.transparent,
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
        headline3: TextStyle(
            fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        headline4: TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: const IconThemeData(color: Colors.black),
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        selectedLabelStyle: const TextStyle(color: Colors.black),
        selectedItemColor: Colors.brown,
        unselectedItemColor: Colors.white,
      ));
  static final ThemeData darktheme = ThemeData(
      backgroundColor: colordarkblue,
      primaryColor: colordarkblue,
      scaffoldBackgroundColor: Colors.transparent,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: colordarkblue),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          fontSize: 18,
          color: coloryelow,
        ),
        headline2: TextStyle(
          fontSize: 24,
          color: coloryelow,
        ),
        headline3: TextStyle(
            fontSize: 25, color: coloryelow, fontWeight: FontWeight.bold),
      ),
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Color(0xFFFACC1D)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: const IconThemeData(color: Color(0xFFFACC1D)),
        unselectedIconTheme: const IconThemeData(color: Colors.white),
        selectedLabelStyle: const TextStyle(color: Color(0xFF141A2E)),
        selectedItemColor: colordarkblue,
        unselectedItemColor: Colors.white,
      ));
}
