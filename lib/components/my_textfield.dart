import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? prefixIcon; // Optional parameter for the prefix icon

  const MyTextfield({
    super.key,
    required this.hintText,
    required this.controller,
    required this.obscureText,
    required this.keyboardType,
    this.prefixIcon, // Add the optional parameter here
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isSmallScreen = size.width < 600;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.01,
        horizontal: size.width * 0.02,
      ),
      width: isSmallScreen ? size.width * 0.9 : size.width * 0.7,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),
          filled: true,
          fillColor: theme.colorScheme.surface,
          border: InputBorder.none,
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: theme.colorScheme.primary, width: 2),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.02,
          ),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: theme.colorScheme.primary)
              : null,
        ),
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurface,
          fontSize: isSmallScreen ? 14 : 16,
        ),
      ),
    );
  }
}
