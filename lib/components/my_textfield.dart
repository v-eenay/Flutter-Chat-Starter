import 'package:flutter/material.dart';

/// A custom text field widget with optional prefix icon support.
class MyTextfield extends StatelessWidget {
  final String hintText; // Placeholder text for the input field
  final TextEditingController controller; // Controller to manage the text input
  final bool obscureText; // Whether the text should be obscured (for passwords)
  final TextInputType
      keyboardType; // Type of keyboard to show (e.g., text, email)
  final IconData? prefixIcon; // Optional icon to show before the text field

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.keyboardType,
    this.prefixIcon, // Optional parameter for the prefix icon
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access the current theme data
    final size = MediaQuery.of(context).size; // Get the screen size
    final isSmallScreen = size.width < 600; // Determine if the screen is small

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.01, // Vertical margin around the text field
        horizontal:
            size.width * 0.02, // Horizontal margin around the text field
      ),
      width: isSmallScreen
          ? size.width * 0.9
          : size.width * 0.7, // Width based on screen size
      child: TextField(
        controller: controller, // Controller for managing text
        obscureText: obscureText, // Control whether the text is obscured
        keyboardType: keyboardType, // Type of keyboard to use
        decoration: InputDecoration(
          hintText: hintText, // Placeholder text
          hintStyle: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface
                .withOpacity(0.6), // Color of the placeholder text
          ),
          filled: true, // Whether to fill the background color
          fillColor: theme.colorScheme.surface, // Background color of the field
          border: InputBorder.none, // No border around the field
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: theme
                  .colorScheme.primary, // Color of the underline when focused
              width: 2, // Width of the underline
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal:
                size.width * 0.04, // Padding inside the field horizontally
            vertical: size.height * 0.02, // Padding inside the field vertically
          ),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon,
                  color: theme.colorScheme.primary) // Icon before the text
              : null, // No icon if prefixIcon is not provided
        ),
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurface, // Text color inside the field
          fontSize: isSmallScreen ? 14 : 16, // Font size based on screen size
        ),
      ),
    );
  }
}
