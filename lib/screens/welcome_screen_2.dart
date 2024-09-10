import 'package:flutter/material.dart';

import 'build_workout/goal_selection_screen.dart';

class WelcomeScreen2 extends StatelessWidget {
  const WelcomeScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Ready to get started?',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  // Replace the current screen
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GoalSelectionScreen()),
                );
              },
              child: const Text('Build My Workout'),
            ),
          ],
        ),
      ),
    );
  }
}
