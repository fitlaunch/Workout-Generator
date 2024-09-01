import 'package:flutter/material.dart';
import 'package:workout_generator/screens/welcome_screen_1.dart';

void main() {
  runApp(const WorkoutGeneratorApp());
}

class WorkoutGeneratorApp extends StatelessWidget {
  const WorkoutGeneratorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WelcomeScreen1(), // Start with the first welcome screen
    );
  }
}
