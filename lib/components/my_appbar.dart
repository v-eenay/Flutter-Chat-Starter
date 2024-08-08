import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? userEmail;
  final VoidCallback onLogout;

  const MyAppbar({
    super.key,
    required this.title,
    this.userEmail,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Profile Avatar
          CircleAvatar(
            radius: 20,
            backgroundColor: theme.colorScheme.primary,
            child: Icon(
              Icons.person,
              color: theme.colorScheme.onPrimary,
            ),
          ),
          // Email
          if (userEmail != null)
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                userEmail!,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onPrimary,
                ),
              ),
            ),
          // Logout Button
          IconButton(
            onPressed: onLogout,
            icon: Icon(Icons.logout),
            color: theme.colorScheme.onPrimary,
            tooltip: 'Logout',
          ),
        ],
      ),
      backgroundColor: theme.colorScheme.primary,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.colorScheme.primaryContainer,
              theme.colorScheme.primary
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
