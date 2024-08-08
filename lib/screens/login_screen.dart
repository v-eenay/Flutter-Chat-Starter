import 'package:flutter/material.dart'; // Import Flutter material design package for UI components
import 'package:sample_chat_app/components/my_button.dart'; // Import custom button component
import 'package:sample_chat_app/components/my_passwordfield.dart'; // Import custom password field component
import 'package:sample_chat_app/components/my_textfield.dart'; // Import custom text field component

import '../services/auth/auth_service.dart'; // Import authentication service for handling sign-in

// LoginScreen is a StatelessWidget that represents the login screen
class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController =
      TextEditingController(); // Controller for email input field
  final TextEditingController _passwordController =
      TextEditingController(); // Controller for password input field

  final void Function()?
      onTap; // Callback function for navigating to the registration screen
  LoginScreen({super.key, required this.onTap});

  // login method to handle user sign-in
  void login(BuildContext context) async {
    final authService =
        AuthService(); // Instance of AuthService to handle authentication

    try {
      // Attempt to sign in with email and password
      await authService.signInWithEmailPassword(
          _emailController.text, // Email entered by the user
          _passwordController.text // Password entered by the user
          );
    } catch (e) {
      // Show an error message if login fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.toString(), // Display the error message
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context)
                      .colorScheme
                      .onError, // Text color for error
                ),
          ),
          backgroundColor: Theme.of(context)
              .colorScheme
              .error, // Background color for the snack bar
          duration: const Duration(seconds: 3), // Duration for the snack bar
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .colorScheme
          .background, // Background color for the screen
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16), // Padding around the content
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center the content horizontally
            children: [
              Icon(
                Icons.message, // Icon displayed on the login screen
                size: 80, // Size of the icon
                color:
                    Theme.of(context).colorScheme.tertiary, // Color of the icon
              ),
              const SizedBox(height: 20), // Space between the icon and text
              Text(
                "Welcome Back, You've been Missed", // Welcome message
                textAlign: TextAlign.center, // Center align the text
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Text color for the title
                      fontWeight: FontWeight.bold, // Bold font weight
                    ),
              ),
              const SizedBox(
                  height: 20), // Space between the title and text fields
              MyTextfield(
                hintText: 'Enter your email', // Hint text for the email field
                controller: _emailController, // Controller for the email input
                obscureText: false, // Not obscured, as it's a text input
                keyboardType:
                    TextInputType.emailAddress, // Keyboard type for email input
                prefixIcon: Icons.email, // Icon for the email field
              ),
              const SizedBox(
                  height: 10), // Space between email and password fields
              MyPasswordField(
                hintText:
                    'Enter your password', // Hint text for the password field
                controller:
                    _passwordController, // Controller for the password input
              ),
              const SizedBox(
                  height:
                      20), // Space between the password field and login button
              MyButton(
                text: 'Login', // Text for the login button
                onPressed: () => login(
                    context), // Call login method when the button is pressed
              ),
              const SizedBox(
                  height:
                      20), // Space between login button and registration text
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Center the text and button horizontally
                children: [
                  Text(
                    "Don't have an account?", // Text prompting user to register
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Color of the text
                    ),
                  ),
                  TextButton(
                    onPressed:
                        onTap, // Callback to navigate to registration screen
                    child: Text(
                      "Register now", // Text for the registration button
                      style: TextStyle(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary, // Color of the button text
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
