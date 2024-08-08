import 'package:flutter/material.dart';

class MyPasswordField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const MyPasswordField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  _MyPasswordFieldState createState() => _MyPasswordFieldState();
}

class _MyPasswordFieldState extends State<MyPasswordField> {
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
        controller: widget.controller,
        obscureText: _obscureText,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: widget.hintText,
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
            vertical: size.height * 0.015,
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: theme.colorScheme.primary,
            size: isSmallScreen ? 20 : 24,
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
              color: theme.colorScheme.primary,
              size: isSmallScreen ? 20 : 24,
            ),
            onPressed: _togglePasswordVisibility,
          ),
        ),
        style: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.onSurface,
          fontSize: isSmallScreen ? 14 : 16,
        ),
      ),
    );
  }
}
