import 'package:flutter/material.dart'; // Import Flutter's material design package for UI components
import 'package:sample_chat_app/components/my_button.dart'; // Import custom button component
import 'package:sample_chat_app/components/my_passwordfield.dart'; // Import custom password field component
import 'package:sample_chat_app/components/my_textfield.dart'; // Import custom text field component

import '../services/auth/auth_service.dart'; // Import authentication service for handling registration

// RegisterScreen is a StatelessWidget representing the registration screen
class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController =
      TextEditingController(); // Controller for email input field
  final TextEditingController _passwordController =
      TextEditingController(); // Controller for password input field
  final TextEditingController _confirmPasswordController =
      TextEditingController(); // Controller for confirm password field

  final void Function()?
      onTap; // Callback function for navigating to the login screen
  RegisterScreen({super.key, required this.onTap});

  // register method to handle user registration
  void register(BuildContext context) async {
    // Check if passwords match
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                "Passwords do not match")), // Show an error message if passwords do not match
      );
      return;
    }

    // Show loading indicator while processing registration
    showDialog(
      context: context,
      barrierDismissible:
          false, // Prevents dismissing the dialog by tapping outside
      builder: (context) => const Center(
          child:
              CircularProgressIndicator()), // Circular progress indicator shown during registration
    );

    try {
      // Register the user using AuthService
      await AuthService().signUpWithEmailPassword(
          _emailController.text, // Email entered by the user
          _passwordController.text // Password entered by the user
          );
      // Registration successful; proceed to the next screen (e.g., login screen)
    } catch (e) {
      // Hide loading indicator
      Navigator.of(context).pop();
      // Show error message if registration fails
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())), // Display the error message
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .colorScheme
          .background, // Background color of the screen
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
                Icons.message, // Icon displayed on the registration screen
                size: 80, // Size of the icon
                color:
                    Theme.of(context).colorScheme.tertiary, // Color of the icon
              ),
              const SizedBox(height: 20), // Space between the icon and text
              Text(
                "Welcome to the Register Page", // Welcome message
                textAlign: TextAlign.center, // Center align the text
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Text color for the title
                      fontWeight: FontWeight.bold, // Bold font weight
                    ),
              ),
              const SizedBox(
                  height: 20), // Space between the title and input fields
              MyTextfield(
                hintText:
                    'Enter your email', // Hint text for the email input field
                controller:
                    _emailController, // Controller for the email input field
                obscureText: false, // Text is not obscured
                keyboardType:
                    TextInputType.emailAddress, // Keyboard type for email input
                prefixIcon: Icons.email, // Icon for the email input field
              ),
              const SizedBox(
                  height: 10), // Space between email and password fields
              MyPasswordField(
                hintText:
                    'Enter your password', // Hint text for the password input field
                controller:
                    _passwordController, // Controller for the password input field
              ),
              const SizedBox(height: 10), // Space between password fields
              MyPasswordField(
                hintText:
                    "Confirm your password", // Hint text for the confirm password input field
                controller:
                    _confirmPasswordController, // Controller for the confirm password input field
              ),
              const SizedBox(
                  height:
                      20), // Space between password fields and register button
              MyButton(
                text: 'Register', // Text for the register button
                onPressed: () => register(
                    context), // Call register method when the button is pressed
              ),
              const SizedBox(
                  height: 20), // Space between register button and login prompt
              Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Center the text and button horizontally
                children: [
                  Text(
                    "Already have an account?", // Text prompting user to login
                    style: TextStyle(
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Color of the text
                    ),
                  ),
                  TextButton(
                    onPressed:
                        onTap, // Callback to navigate to the login screen
                    child: Text(
                      "Login now", // Text for the login button
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
