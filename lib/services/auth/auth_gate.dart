import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Authentication package
import 'package:flutter/material.dart'; // Import Flutter's material design package for UI components
import 'package:sample_chat_app/services/auth/login_or_register.dart'; // Import the login or register screen
import 'package:sample_chat_app/screens/home_screen.dart'; // Import the home screen

// AuthGate is a StatelessWidget that manages authentication state
class AuthGate extends StatelessWidget {
  const AuthGate({super.key}); // Constructor with a key parameter

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance
              .authStateChanges(), // Listen to authentication state changes
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // If the snapshot has data, user is authenticated
              return HomePage(); // Show the home page for authenticated users
            } else {
              return const LoginOrRegister(); // Show the login or register screen for unauthenticated users
            }
          }),
    );
  }
}
