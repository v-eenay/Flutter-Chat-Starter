import 'package:flutter/material.dart';

/// A custom button widget that adapts its size and style based on screen width.
class MyButton extends StatelessWidget {
  /// The text displayed on the button.
  final String text;

  /// Callback function that is triggered when the button is pressed.
  final VoidCallback onPressed;

  /// Creates a new instance of MyButton with the given [text] and [onPressed] callback.
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Obtain the current theme data from the context to style the button.
    final theme = Theme.of(context);

    // Get the width of the screen.
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      // Adjust the width of the button based on screen width.
      width: screenWidth > 600
          ? screenWidth /
              8 // For larger screens, set width to 1/8 of screen width
          : screenWidth /
              1.5, // For smaller screens, set width to 1/1.5 of the screen width
      height: 60, // Set a consistent height for better touch target

      child: ElevatedButton(
        onPressed:
            onPressed, // Trigger the onPressed callback when the button is pressed
        style: ElevatedButton.styleFrom(
          foregroundColor:
              theme.colorScheme.onPrimary, // Text color on the button
          backgroundColor:
              theme.colorScheme.primary, // Background color of the button
          padding: const EdgeInsets.symmetric(
              horizontal: 24, vertical: 16), // Padding inside the button
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(28), // Rounded corners for the button
          ),
          elevation: 2, // Slight shadow effect to give depth
          shadowColor: theme.colorScheme.primary
              .withOpacity(0.3), // Color and opacity of the shadow
          side: BorderSide(
            color: theme.colorScheme.primary
                .withOpacity(0.5), // Color and opacity of the border
            width: 1.5, // Width of the border
          ),
        ),
        child: Text(
          text,
          style: theme.textTheme.labelLarge?.copyWith(
            fontSize: 18, // Font size of the button text
            fontWeight: FontWeight.w600, // Font weight to make the text bold
            letterSpacing:
                1.2, // Spacing between letters for better readability
            color: theme.colorScheme.onPrimary, // Color of the text
          ),
        ),
      ),
    );
  }
}
