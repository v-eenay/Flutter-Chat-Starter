import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';
import '../screens/settings_screen.dart';

/// A custom Drawer widget that provides navigation options and user-related actions.
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  /// Logs out the current user and closes the drawer.
  void logout(BuildContext context) {
    AuthService().signOut(); // Sign out the user
    Navigator.pop(context); // Close the drawer after logging out
  }

  @override
  Widget build(BuildContext context) {
    // Obtain the current theme data to style the drawer.
    final theme = Theme.of(context);

    // Get the width of the screen to adapt the layout for small screens.
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600; // Determine if the screen is small

    return Drawer(
      backgroundColor:
          theme.colorScheme.surface, // Background color of the drawer
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space items evenly
        children: [
          // Drawer Header
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.chat, // Chat icon for the header
                  size:
                      isSmallScreen ? 50 : 60, // Adjust size for small screens
                  color: theme.colorScheme.primary, // Icon color
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 8 : 16),
                child: Text(
                  "ChatAppVeenay", // App name
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary, // Text color
                    fontWeight: FontWeight.bold, // Bold text
                  ),
                ),
              ),
              Text(
                AuthService().getCurrentUser()?.email ??
                    '', // Display user email
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary, // Text color
                ),
              ),
              const SizedBox(height: 20), // Space between elements
            ],
          ),

          // Navigation Items
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.home,
                    color: theme.colorScheme.primary), // Home icon
                title: Text("H O M E",
                    style: theme.textTheme.bodyLarge), // Home title
                onTap: () => Navigator.pop(context), // Close drawer on tap
              ),
              ListTile(
                leading: Icon(Icons.settings,
                    color: theme.colorScheme.primary), // Settings icon
                title: Text("S E T T I N G S",
                    style: theme.textTheme.bodyLarge), // Settings title
                onTap: () {
                  Navigator.pop(context); // Close drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const SettingsScreen(), // Navigate to SettingsScreen
                    ),
                  );
                },
              ),
            ],
          ),

          // Logout
          Padding(
            padding: EdgeInsets.only(
                bottom: isSmallScreen
                    ? 20
                    : 30), // Adjust padding for small screens
            child: ListTile(
              leading: Icon(Icons.logout,
                  color: theme.colorScheme.primary), // Logout icon
              title: Text("L O G O U T",
                  style: theme.textTheme.bodyLarge), // Logout title
              onTap: () => logout(context), // Call logout method
            ),
          ),
        ],
      ),
    );
  }
}
