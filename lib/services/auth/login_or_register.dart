import 'package:flutter/material.dart';

import '../../screens/login_screen.dart'; // Import the login screen
import '../../screens/register_screen.dart'; // Import the registration screen

// LoginOrRegister widget that toggles between login and registration screens
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

// State class for managing the login or registration screen
class _LoginOrRegisterState extends State<LoginOrRegister> {
  // Boolean to determine whether to show the login or registration screen
  bool showLogin = true;

  // Method to toggle between login and registration screens
  void toggleScreens() {
    setState(() {
      showLogin = !showLogin; // Toggle the boolean value
    });
  }

  @override
  Widget build(BuildContext context) {
    // Return the appropriate screen based on the value of showLogin
    if (showLogin) {
      return LoginScreen(
        onTap: toggleScreens, // Pass the toggleScreens method to LoginScreen
      );
    } else {
      return RegisterScreen(
        onTap: toggleScreens, // Pass the toggleScreens method to RegisterScreen
      );
    }
  }
}
