import 'package:flutter/material.dart';
import 'config/routes.dart';
import 'core/presentation/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture App',
      debugShowCheckedModeBanner: false,
      home: MainScreen(), // Cambiamos para usar MainScreen
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}
