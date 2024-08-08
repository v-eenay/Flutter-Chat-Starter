import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF1E1E1E), // Dark grey
    primary: Color(0xFF388E3C), // Dark green
    secondary: Color(0xFF00796B), // Dark teal
    tertiary: Color(0xFF1565C0), // Dark blue
    inversePrimary: Color(0xFF64B5F6), // Light blue
  ),
  scaffoldBackgroundColor: const Color(0xFF121212), // Dark background
  appBarTheme: const AppBarTheme(
    color: Color(0xFF388E3C), // Dark green
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600, // Semi-bold
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.white70,
      fontSize: 16,
      fontWeight: FontWeight.w400, // Regular
    ),
    bodyMedium: TextStyle(
      color: Colors.white60,
      fontSize: 14,
      fontWeight: FontWeight.w400, // Regular
    ),
    displayLarge: TextStyle(
      color: Colors.white,
      fontSize: 32,
      fontWeight: FontWeight.w700, // Bold
    ),
    displayMedium: TextStyle(
      color: Colors.white70,
      fontSize: 28,
      fontWeight: FontWeight.w500, // Medium
    ),
    displaySmall: TextStyle(
      color: Colors.white70,
      fontSize: 24,
      fontWeight: FontWeight.w400, // Regular
    ),
    headlineMedium: TextStyle(
      color: Colors.white70,
      fontSize: 20,
      fontWeight: FontWeight.w500, // Medium
    ),
    headlineSmall: TextStyle(
      color: Colors.white70,
      fontSize: 18,
      fontWeight: FontWeight.w500, // Medium
    ),
    titleLarge: TextStyle(
      color: Colors.white70,
      fontSize: 16,
      fontWeight: FontWeight.w600, // Semi-bold
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF00796B), // Dark teal
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF00796B), // Dark teal
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600, // Semi-bold
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF2C2C2C), // Dark grey
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF1565C0)), // Dark blue
    ),
    labelStyle: const TextStyle(
      color: Colors.white60,
      fontWeight: FontWeight.w400, // Regular
    ),
    hintStyle: const TextStyle(
      color: Colors.white38,
      fontWeight: FontWeight.w300, // Light
    ),
  ),
  cardTheme: CardTheme(
    color: const Color(0xFF2C2C2C), // Dark grey
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 1.5,
    margin: const EdgeInsets.all(8),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF00796B), // Dark teal
    size: 24,
  ),
  dividerColor: Colors.white12,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF64B5F6), // Light blue
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF00796B), // Dark teal
    foregroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF121212), // Dark background
    selectedItemColor: Color(0xFF00796B), // Dark teal
    unselectedItemColor: Colors.white60,
  ),
);
