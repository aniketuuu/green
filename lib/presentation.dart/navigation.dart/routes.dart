import 'package:flutter/material.dart';
import 'package:green/presentation.dart/screens.dart/first.dart';
import 'package:green/presentation.dart/screens.dart/second.dart';
import 'package:green/presentation.dart/screens.dart/third.dart';
import 'package:green/presentation.dart/screens.dart/fourth.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes => {
    '/home': (context) => const WhyCarbonNeutralScreen(),
    '/how-helps': (context) => const HowAppHelpsScreen(),
    '/calculator': (context) => const FootprintCalculatorScreen(),
    '/choose-role': (context) => const ChooseRoleScreen(),

    '/builder-dashboard': (context) =>
        const Placeholder(), // Replace with BuilderDashboardScreen()
    '/architect-dashboard': (context) =>
        const Placeholder(), // Replace with ArchitectDashboardScreen()
    '/student-dashboard': (context) =>
        const Placeholder(), // Replace with StudentDashboardScreen()
    '/policy-dashboard': (context) =>
        const Placeholder(), // Replace with PolicyDashboardScreen()
  };
}
