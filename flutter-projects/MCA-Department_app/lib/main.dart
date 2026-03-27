import 'package:flutter/material.dart';

import 'routes/app_routes.dart';
import 'screens/main_shell_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const DepartmentApp());
}

class DepartmentApp extends StatelessWidget {
  const DepartmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MCA Department',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      home: const MainShellScreen(),
      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
