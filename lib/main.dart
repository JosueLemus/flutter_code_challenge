import 'package:flutter/material.dart';
import 'package:flutter_code_challenge/core/di/dependencies.dart';
import 'package:flutter_code_challenge/modules/home/presenter/home_screen.dart';

void main() {
  setupDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
