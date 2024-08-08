import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFF0F4C3), // Soft light green
    primary: Color(0xFF81C784), // Light green
    secondary: Color(0xFF4DB6AC), // Teal
    tertiary: Color(0xFF64B5F6), // Light blue
    inversePrimary: Color(0xFF1E88E5), // Blue
  ),
  scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Off-white
  appBarTheme: const AppBarTheme(
    color: Color(0xFF81C784), // Light green
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
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.w400, // Regular
    ),
    bodyMedium: TextStyle(
      color: Colors.black54,
      fontSize: 14,
      fontWeight: FontWeight.w400, // Regular
    ),
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 32,
      fontWeight: FontWeight.w700, // Bold
    ),
    displayMedium: TextStyle(
      color: Colors.black87,
      fontSize: 28,
      fontWeight: FontWeight.w500, // Medium
    ),
    displaySmall: TextStyle(
      color: Colors.black87,
      fontSize: 24,
      fontWeight: FontWeight.w400, // Regular
    ),
    headlineMedium: TextStyle(
      color: Colors.black87,
      fontSize: 20,
      fontWeight: FontWeight.w500, // Medium
    ),
    headlineSmall: TextStyle(
      color: Colors.black87,
      fontSize: 18,
      fontWeight: FontWeight.w500, // Medium
    ),
    titleLarge: TextStyle(
      color: Colors.black87,
      fontSize: 16,
      fontWeight: FontWeight.w600, // Semi-bold
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF4DB6AC), // Teal
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: const Color(0xFF4DB6AC), // Teal
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
    fillColor: const Color(0xFFFFFFFF),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Color(0xFF64B5F6)), // Light blue
    ),
    labelStyle: const TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w400, // Regular
    ),
    hintStyle: const TextStyle(
      color: Colors.black26,
      fontWeight: FontWeight.w300, // Light
    ),
  ),
  cardTheme: CardTheme(
    color: const Color(0xFFFFFFFF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 1.5,
    margin: const EdgeInsets.all(8),
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF4DB6AC), // Teal
    size: 24,
  ),
  dividerColor: Colors.black12,
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: const Color(0xFF64B5F6), // Light blue
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF4DB6AC), // Teal
    foregroundColor: Colors.white,
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFF5F5F5), // Off-white
    selectedItemColor: Color(0xFF4DB6AC), // Teal
    unselectedItemColor: Colors.black54,
  ),
);
