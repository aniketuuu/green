import 'package:flutter/material.dart';
import 'package:green/presentation.dart/screens.dart/splash.dart';
import 'package:green/presentation.dart/navigation.dart/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Neutral Construction',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: AppRoutes.routes,
    );
  }
}
