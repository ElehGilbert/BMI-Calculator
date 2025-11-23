import 'package:bmi_calculator/Pages/home.dart';
import 'package:flutter/material.dart';

/// Main entry point of the application
/// This is the first function that runs when the app starts
void main() {
  // runApp() takes the given Widget and makes it the root of the widget tree
  runApp(const MyApp());
}

/// MyApp is the root widget of the application
/// It's a StatelessWidget because the app configuration doesn't change
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp provides Material Design visual structure and navigation
    // It wraps the entire app and provides theme, routes, etc.
    return MaterialApp(
      // Title appears in task manager (Android) or window title (Desktop)
      title: 'BMI Calculator',
      
      // debugShowCheckedModeBanner: false removes the debug banner in top-right
      debugShowCheckedModeBanner: false,
      
      // ThemeData defines the visual theme for the entire app
      theme: ThemeData(
        // useMaterial3 enables the latest Material Design 3 components
        useMaterial3: true,
        
        // Define the primary color scheme from a seed color
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4A90E2), // Blue color
          brightness: Brightness.light, // Light theme
        ),
        
        // Font family for the entire app
        fontFamily: 'Roboto',
      ),
      
      // The home property defines the default route (first screen shown)
      home: const Home(),
    );
  }
}

