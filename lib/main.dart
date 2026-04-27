import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

// Point d'entrée : Flutter commence ici
void main() {
  runApp(const WhatsAppClone());
}

class WhatsAppClone extends StatelessWidget {
  const WhatsAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      debugShowCheckedModeBanner: false, // Enlève le bandeau DEBUG
      themeMode: ThemeMode.dark,         // Dark mode
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF111B21),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}