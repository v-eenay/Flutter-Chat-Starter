import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sample_chat_app/themes/dark_mode.dart';
import 'package:sample_chat_app/themes/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  // Boolean to track if dark mode is enabled
  bool _isDarkMode = false;

  // Getter for _isDarkMode
  bool get isDarkMode => _isDarkMode;

  // Constructor that loads the theme from shared preferences
  ThemeProvider() {
    _loadTheme();
  }

  // Method to toggle between dark and light mode
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _saveTheme(_isDarkMode); // Save the new theme setting
    notifyListeners(); // Notify listeners to update the UI
  }

  // Method to get the appropriate ThemeData based on the current mode
  ThemeData get themeData => _isDarkMode ? darkMode : lightMode;

  // Asynchronous method to load the theme setting from shared preferences
  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ??
        false; // Default to false if no preference found
    notifyListeners(); // Notify listeners to update the UI
  }

  // Asynchronous method to save the theme setting to shared preferences
  Future<void> _saveTheme(bool isDarkMode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', isDarkMode); // Save the theme setting
  }
}
