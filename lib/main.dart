import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/core/di/dependencies.dart';
import 'package:flutter_code_challenge/core/theme/app_theme.dart';
import 'package:flutter_code_challenge/modules/home/presenter/screens/home_screen.dart';

void main() {
  setupDependencies();
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
