import 'package:flutter/material.dart';

/// A custom AppBar widget that includes a title, user email, profile avatar, and a logout button.
class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  /// The title displayed in the AppBar.
  final String title;

  /// The email of the current user, displayed on the right side of the AppBar.
  /// If null, the email will not be shown.
  final String? userEmail;

  /// Callback function triggered when the logout button is pressed.
  final VoidCallback onLogout;

  /// Creates a new instance of MyAppbar with the given [title], optional [userEmail], and [onLogout] callback.
  const MyAppbar({
    super.key,
    required this.title,
    this.userEmail,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    // Obtain the current theme data from the context.
    final theme = Theme.of(context);

    return AppBar(
      // Use a Row to place elements horizontally within the AppBar.
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title section
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onPrimary, // Color of the title text
                fontWeight: FontWeight.bold, // Bold font weight for the title
              ),
            ),
          ),
          // Profile Avatar section
          CircleAvatar(
            radius: 20, // Radius of the circle avatar
            backgroundColor:
                theme.colorScheme.primary, // Background color of the avatar
            child: Icon(
              Icons.person,
              color: theme.colorScheme.onPrimary, // Color of the avatar icon
            ),
          ),
          // Email section (only displayed if userEmail is not null)
          if (userEmail != null)
            Padding(
              padding: const EdgeInsets.only(
                  right: 16.0), // Right padding for spacing
              child: Text(
                userEmail!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onPrimary, // Color of the email text
                ),
              ),
            ),
          // Logout button section
          IconButton(
            onPressed: onLogout, // Trigger the onLogout callback when pressed
            icon: Icon(Icons.logout),
            color: theme.colorScheme.onPrimary, // Color of the logout icon
            tooltip: 'Logout', // Tooltip displayed on long press
          ),
        ],
      ),
      backgroundColor:
          theme.colorScheme.primary, // Background color of the AppBar
      elevation: 0, // Remove shadow effect for a flat look
      flexibleSpace: Container(
        // Apply a gradient background to the AppBar
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primaryContainer, // Start color of the gradient
              theme.colorScheme.primary // End color of the gradient
            ],
            begin: Alignment.topLeft, // Gradient starts from the top left
            end: Alignment.bottomRight, // Gradient ends at the bottom right
          ),
        ),
      ),
    );
  }

  @override
  // Define the preferred size for the AppBar
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
