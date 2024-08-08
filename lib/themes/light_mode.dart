import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFF0F4C3), // Soft light green for surfaces
    primary: Color(0xFF81C784), // Light green for primary elements
    secondary: Color(0xFF4DB6AC), // Teal for secondary elements
    tertiary: Color(0xFF64B5F6), // Light blue for tertiary elements
    inversePrimary: Color(0xFF1E88E5), // Blue for inverse primary elements
  ),
  scaffoldBackgroundColor:
      const Color(0xFFF5F5F5), // Off-white background color for the scaffold
  appBarTheme: const AppBarTheme(
    color: Color(0xFF81C784), // Light green for the app bar
    iconTheme: IconThemeData(
      color: Colors.white, // White color for app bar icons
    ),
    titleTextStyle: TextStyle(
      color: Colors.white, // White color for app bar title
      fontSize: 20,
      fontWeight: FontWeight.w600, // Semi-bold font weight
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Colors.black87, // Dark gray for large body text
      fontSize: 16,
      fontWeight: FontWeight.w400, // Regular font weight
    ),
    bodyMedium: TextStyle(
      color: Colors.black54, // Medium gray for medium body text
      fontSize: 14,
      fontWeight: FontWeight.w400, // Regular font weight
    ),
    displayLarge: TextStyle(
      color: Colors.black, // Black color for large display text
      fontSize: 32,
      fontWeight: FontWeight.w700, // Bold font weight
    ),
    displayMedium: TextStyle(
      color: Colors.black87, // Dark gray for medium display text
      fontSize: 28,
      fontWeight: FontWeight.w500, // Medium font weight
    ),
    displaySmall: TextStyle(
      color: Colors.black87, // Dark gray for small display text
      fontSize: 24,
      fontWeight: FontWeight.w400, // Regular font weight
    ),
    headlineMedium: TextStyle(
      color: Colors.black87, // Dark gray for medium headlines
      fontSize: 20,
      fontWeight: FontWeight.w500, // Medium font weight
    ),
    headlineSmall: TextStyle(
      color: Colors.black87, // Dark gray for small headlines
      fontSize: 18,
      fontWeight: FontWeight.w500, // Medium font weight
    ),
    titleLarge: TextStyle(
      color: Colors.black87, // Dark gray for large titles
      fontSize: 16,
      fontWeight: FontWeight.w600, // Semi-bold font weight
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF4DB6AC), // Teal color for buttons
    textTheme: ButtonTextTheme.primary, // Use primary color for button text
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, // White color for button text
      backgroundColor:
          const Color(0xFF4DB6AC), // Teal color for button background
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600, // Semi-bold font weight
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners for buttons
      ),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFFFFFFFF), // White color for input fields
    border: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(12), // Rounded corners for input fields
      borderSide: BorderSide.none, // No border line
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(12), // Rounded corners for focused input fields
      borderSide: const BorderSide(
          color: Color(0xFF64B5F6)), // Light blue border when focused
    ),
    labelStyle: const TextStyle(
      color: Colors.black54, // Medium gray for input labels
      fontWeight: FontWeight.w400, // Regular font weight
    ),
    hintStyle: const TextStyle(
      color: Colors.black26, // Light gray for hints
      fontWeight: FontWeight.w300, // Light font weight
    ),
  ),
  cardTheme: CardTheme(
    color: const Color(0xFFFFFFFF), // White color for cards
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners for cards
    ),
    elevation: 1.5, // Shadow elevation for cards
    margin: const EdgeInsets.all(8), // Margin around cards
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF4DB6AC), // Teal color for icons
    size: 24, // Icon size
  ),
  dividerColor: Colors.black12, // Light gray color for dividers
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor:
          const Color(0xFF64B5F6), // Light blue color for text buttons
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Color(0xFF4DB6AC), // Teal color for floating action button
    foregroundColor:
        Colors.white, // White color for floating action button icon
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(
        0xFFF5F5F5), // Off-white background color for bottom navigation bar
    selectedItemColor: Color(0xFF4DB6AC), // Teal color for selected item
    unselectedItemColor: Colors.black54, // Medium gray for unselected items
  ),
);
