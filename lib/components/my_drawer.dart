import 'package:flutter/material.dart';

import '../services/auth/auth_service.dart';
import '../screens/settings_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(BuildContext context) {
    AuthService().signOut();
    Navigator.pop(context); // Close drawer after logout
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Drawer(
      backgroundColor: theme.colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header
          Column(
            children: [
              DrawerHeader(
                child: Icon(
                  Icons.chat,
                  size: isSmallScreen ? 50 : 60,
                  color: theme.colorScheme.primary,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: isSmallScreen ? 8 : 16),
                child: Text(
                  "ChatAppVeenay",
                  style: theme.textTheme.titleLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                AuthService().getCurrentUser()?.email ?? '',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),

          // Navigation Items
          Column(
            children: [
              ListTile(
                leading: Icon(Icons.home, color: theme.colorScheme.primary),
                title: Text("H O M E", style: theme.textTheme.bodyLarge),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                leading: Icon(Icons.settings, color: theme.colorScheme.primary),
                title:
                    Text("S E T T I N G S", style: theme.textTheme.bodyLarge),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                  );
                },
              ),
            ],
          ),

          // Logout
          Padding(
            padding: EdgeInsets.only(bottom: isSmallScreen ? 20 : 30),
            child: ListTile(
              leading: Icon(Icons.logout, color: theme.colorScheme.primary),
              title: Text("L O G O U T", style: theme.textTheme.bodyLarge),
              onTap: () => logout(context),
            ),
          ),
        ],
      ),
    );
  }
}
