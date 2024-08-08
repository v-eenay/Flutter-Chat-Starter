import 'package:flutter/material.dart'; // Import Flutter's material design package for UI components
import 'package:provider/provider.dart'; // Import the Provider package for state management
import '../services/themes/theme_provider.dart'; // Import the theme provider service

// SettingsScreen is a StatelessWidget representing the settings screen
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key}); // Constructor with a key parameter

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(
        context); // Access the ThemeProvider instance

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"), // Title of the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment
              .start, // Align children to the start of the column
          children: [
            ListTile(
              title: const Text('Dark Mode'), // Title of the list tile
              trailing: Switch(
                value: themeProvider
                    .isDarkMode, // Current theme mode (dark or light)
                onChanged: (value) {
                  themeProvider
                      .toggleTheme(); // Toggle the theme mode when the switch is changed
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
