import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_chat_app/services/auth/auth_gate.dart';
import 'package:sample_chat_app/firebase_options.dart';
import 'package:sample_chat_app/services/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensures Flutter is initialized before Firebase
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions
          .currentPlatform); // Initializes Firebase with options
  runApp(const MyApp()); // Runs the app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          ThemeProvider(), // Provides ThemeProvider to the widget tree
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false, // Disables the debug banner
            home:
                const AuthGate(), // The entry point of your app, handles authentication state
            theme: themeProvider
                .themeData, // Applies the theme based on the ThemeProvider
          );
        },
      ),
    );
  }
}
