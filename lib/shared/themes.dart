import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    elevation: 0.0,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    elevation: 0.0,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.black,
    selectedIconTheme: IconThemeData(
      color: Colors.amber[400],
    ),
    selectedLabelStyle: TextStyle(color: Colors.black),
    unselectedLabelStyle: TextStyle(color: Colors.black),
    selectedItemColor: Colors.black,
  ),
);
