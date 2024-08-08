import 'package:flutter/material.dart';

/// A custom password field widget with visibility toggle.
class MyPasswordField extends StatefulWidget {
  final String hintText; // Placeholder text for the input field
  final TextEditingController controller; // Controller to manage the text input

  const MyPasswordField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  _MyPasswordFieldState createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool _obscureText = true; // State to toggle password visibility

  /// Toggles the visibility of the password text.
  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Inverts the current state
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Access the current theme data
    final size = MediaQuery.of(context).size; // Get the screen size
    final isSmallScreen = size.width < 600; // Determine if the screen is small

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.01, // Vertical margin
        horizontal: size.width * 0.02, // Horizontal margin
      ),
      width: isSmallScreen
          ? size.width * 0.9
          : size.width * 0.7, // Set width based on screen size
      child: TextField(
        controller: widget.controller, // Controller for managing text
        obscureText: _obscureText, // Control whether the text is obscured
        keyboardType: TextInputType.text, // Input type for text
        decoration: InputDecoration(
          hintText: widget.hintText, // Placeholder text
          hintStyle: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface
                .withOpacity(0.6), // Placeholder text color
          ),
          filled: true,
          fillColor: theme.colorScheme.surface, // Background color of the field
          border: InputBorder.none, // No border
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: theme
                  .colorScheme.primary, // Color of the underline when focused
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04, // Padding inside the field
            vertical: size.height * 0.015,
          ),
          prefixIcon: Icon(
            Icons.lock, // Icon to show before the text field
            color: theme.colorScheme.primary, // Icon color
            size: isSmallScreen ? 20 : 24, // Icon size based on screen size
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText
                  ? Icons.visibility_off
                  : Icons.visibility, // Toggle icon
              color: theme.colorScheme.primary, // Icon color
              size: isSmallScreen ? 20 : 24, // Icon size based on screen size
            ),
            onPressed:
                _togglePasswordVisibility, // Toggle password visibility on press
          ),
        ),
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurface, // Text color inside the field
          fontSize: isSmallScreen ? 14 : 16, // Font size based on screen size
        ),
      ),
    );
  }
}
