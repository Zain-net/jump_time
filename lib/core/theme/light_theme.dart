import 'package:flutter/material.dart';

ThemeData lightThemeData() {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,

    textTheme: const TextTheme(
      labelSmall: TextStyle(color: Color(0xFF41677F), fontSize: 15),
      labelMedium: TextStyle(
        color: Color(0xFF41677F),
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    ),

    appBarTheme: const AppBarThemeData(
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 17,
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF2094F3),
        foregroundColor: Colors.white,
        fixedSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(11)),
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    ),

    iconTheme: const IconThemeData(size: 50),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      unselectedItemColor: Color(0xFF41677F),
      selectedItemColor: Colors.black,
      selectedIconTheme: IconThemeData(color: Colors.black),
      selectedLabelStyle: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
      unselectedIconTheme: IconThemeData(color: Color(0xFF41677F)),
      unselectedLabelStyle: TextStyle(color: Color(0xFF41677F), fontSize: 15),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      elevation: 0,
      type: BottomNavigationBarType.fixed
    ),
  );
}
