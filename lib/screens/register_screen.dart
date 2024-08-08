import 'package:flutter/material.dart';
import 'package:sample_chat_app/components/my_button.dart';
import 'package:sample_chat_app/components/my_passwordfield.dart';
import 'package:sample_chat_app/components/my_textfield.dart';

import '../services/auth/auth_service.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final void Function()? onTap;
  RegisterScreen({super.key, required this.onTap});

  void register(BuildContext context) async {
    // Check if passwords match
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Passwords do not match")),
      );
      return;
    }

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );

    try {
      // Register the user using AuthService
      await AuthService().signUpWithEmailPassword(
          _emailController.text, _passwordController.text);
      // Registration successful, navigate to the next screen
    } catch (e) {
      // Hide loading indicator
      Navigator.of(context).pop();
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.message,
                size: 80,
                color: Theme.of(context).colorScheme.tertiary,
              ),
              const SizedBox(height: 20),
              Text(
                "Welcome to the Register Page",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 20),
              MyTextfield(
                hintText: 'Enter your email',
                controller: _emailController,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email,
              ),
              const SizedBox(height: 10),
              MyPasswordField(
                hintText: 'Enter your password',
                controller: _passwordController,
              ),
              const SizedBox(height: 10),
              MyPasswordField(
                hintText: "Confirm your password",
                controller: _confirmPasswordController,
              ),
              const SizedBox(height: 20),
              MyButton(
                text: 'Register',
                onPressed: () => register(context),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  TextButton(
                    onPressed: onTap,
                    child: Text(
                      "Login now",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary,
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
