import 'package:flutter/material.dart';

/// A custom widget representing a user tile with an icon and text.
///
/// The tile is displayed as a card with a rounded border and supports tap interactions.
class UserTile extends StatelessWidget {
  final String text; // Text to display on the tile
  final void Function()? onTap; // Callback function when the tile is tapped

  const UserTile({
    super.key,
    required this.text,
    required this.onTap, // Function to handle tap events
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Retrieve the current theme
    final cardThemeShape = theme.cardTheme.shape
        as RoundedRectangleBorder?; // Get card shape from theme
    final borderRadius = cardThemeShape?.borderRadius as BorderRadius? ??
        BorderRadius.circular(15); // Use default border radius if not specified

    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 16.0), // Margin around the tile
      child: GestureDetector(
        onTap: onTap, // Trigger the onTap callback when the tile is tapped
        child: Card(
          elevation:
              theme.cardTheme.elevation ?? 5, // Elevation for shadow effect
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius, // Set rounded corners for the card
          ),
          color: theme.cardColor, // Background color of the card
          child: Container(
            padding: const EdgeInsets.all(16), // Padding inside the card
            decoration: BoxDecoration(
              color:
                  theme.cardColor, // Match card color for container background
              borderRadius: borderRadius, // Match border radius
            ),
            child: Row(
              children: [
                Icon(
                  Icons.person, // Icon to display on the left side
                  color: theme.iconTheme.color
                      ?.withOpacity(0.7), // Icon color with slight opacity
                ),
                const SizedBox(width: 20), // Space between icon and text
                Text(
                  text, // Display the provided text
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: theme.textTheme.bodyLarge?.color
                        ?.withOpacity(0.9), // Text color with slight opacity
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
