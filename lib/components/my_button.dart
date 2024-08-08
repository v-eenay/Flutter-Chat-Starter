import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: MediaQuery.of(context).size.width > 600
          ? screenWidth / 8
          : screenWidth / 1.5, // Half the page width
      height: MediaQuery.of(context).size.width > 600
          ? 60
          : 60, // Increased height for better touch target
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          foregroundColor: theme.colorScheme.onPrimary,
          backgroundColor: theme.colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(28), // More rounded corners
          ),
          elevation: 2, // Slight elevation for depth
          shadowColor:
              theme.colorScheme.primary.withOpacity(0.3), // Subtle shadow
          side: BorderSide(
            color: theme.colorScheme.primary
                .withOpacity(0.5), // More visible border
            width: 1.5,
          ),
        ),
        child: Text(
          text,
          style: theme.textTheme.labelLarge?.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: theme.colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
