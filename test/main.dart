
import 'package:flutter/material.dart';
import 'button_test.dart';  // Add this import
import '../lib/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: const TestButtonScreen(),  // ← Show test screen instead
    );
  }
}
