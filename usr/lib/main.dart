import 'package:flutter/material.dart';
import 'theme/app_colors.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(const ELearningApp());
}

class ELearningApp extends StatelessWidget {
  const ELearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Learning Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          background: AppColors.background,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'Roboto', // Default fallback
      ),
      home: const DashboardScreen(),
    );
  }
}
