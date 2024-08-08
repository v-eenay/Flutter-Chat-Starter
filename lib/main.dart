import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_chat_app/services/auth/auth_gate.dart';
import 'package:sample_chat_app/firebase_options.dart';
import 'package:sample_chat_app/services/themes/theme_provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const AuthGate(),
            theme: themeProvider.themeData,
          );
        },
      ),
    );
  }
}
