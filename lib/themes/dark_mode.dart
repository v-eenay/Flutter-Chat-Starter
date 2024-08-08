import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: const ColorScheme.dark(
    surface: Color(0xFF1E1E1E), // Dark grey for surfaces
    primary: Color(0xFF388E3C), // Dark green for primary elements
    secondary: Color(0xFF00796B), // Dark teal for secondary elements
    tertiary: Color(0xFF1565C0), // Dark blue for tertiary elements
    inversePrimary:
        Color(0xFF64B5F6), // Light blue for inverse primary elements
  ),
  scaffoldBackgroundColor:
      const Color(0xFF121212), // Very dark background color for the scaffold
  appBarTheme: const AppBarTheme(
    color: Color(0xFF388E3C), // Dark green color for the app bar
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
      color: Colors.white70, // Light white color for large body text
      fontSize: 16,
      fontWeight: FontWeight.w400, // Regular font weight
    ),
    bodyMedium: TextStyle(
      color:
          Colors.white60, // Slightly lighter white color for medium body text
      fontSize: 14,
      fontWeight: FontWeight.w400, // Regular font weight
    ),
    displayLarge: TextStyle(
      color: Colors.white, // White color for large display text
      fontSize: 32,
      fontWeight: FontWeight.w700, // Bold font weight
    ),
    displayMedium: TextStyle(
      color: Colors.white70, // Light white color for medium display text
      fontSize: 28,
      fontWeight: FontWeight.w500, // Medium font weight
    ),
    displaySmall: TextStyle(
      color: Colors.white70, // Light white color for small display text
      fontSize: 24,
      fontWeight: FontWeight.w400, // Regular font weight
    ),
    headlineMedium: TextStyle(
      color: Colors.white70, // Light white color for medium headlines
      fontSize: 20,
      fontWeight: FontWeight.w500, // Medium font weight
    ),
    headlineSmall: TextStyle(
      color: Colors.white70, // Light white color for small headlines
      fontSize: 18,
      fontWeight: FontWeight.w500, // Medium font weight
    ),
    titleLarge: TextStyle(
      color: Colors.white70, // Light white color for large titles
      fontSize: 16,
      fontWeight: FontWeight.w600, // Semi-bold font weight
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Color(0xFF00796B), // Dark teal color for buttons
    textTheme: ButtonTextTheme.primary, // Use primary color for button text
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white, // White color for button text
      backgroundColor:
          const Color(0xFF00796B), // Dark teal color for button background
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
    fillColor: const Color(0xFF2C2C2C), // Dark grey color for input fields
    border: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(12), // Rounded corners for input fields
      borderSide: BorderSide.none, // No border line
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(12), // Rounded corners for focused input fields
      borderSide: const BorderSide(
          color: Color(0xFF1565C0)), // Dark blue border when focused
    ),
    labelStyle: const TextStyle(
      color: Colors.white60, // Light white color for input labels
      fontWeight: FontWeight.w400, // Regular font weight
    ),
    hintStyle: const TextStyle(
      color: Colors.white38, // Very light white color for hints
      fontWeight: FontWeight.w300, // Light font weight
    ),
  ),
  cardTheme: CardTheme(
    color: const Color(0xFF2C2C2C), // Dark grey color for cards
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners for cards
    ),
    elevation: 1.5, // Shadow elevation for cards
    margin: const EdgeInsets.all(8), // Margin around cards
  ),
  iconTheme: const IconThemeData(
    color: Color(0xFF00796B), // Dark teal color for icons
    size: 24, // Icon size
  ),
  dividerColor: Colors.white12, // Very light white color for dividers
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor:
          const Color(0xFF64B5F6), // Light blue color for text buttons
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor:
        Color(0xFF00796B), // Dark teal color for floating action button
    foregroundColor:
        Colors.white, // White color for floating action button icon
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(
        0xFF121212), // Very dark background color for the bottom navigation bar
    selectedItemColor: Color(0xFF00796B), // Dark teal color for selected item
    unselectedItemColor:
        Colors.white60, // Light white color for unselected items
  ),
);
