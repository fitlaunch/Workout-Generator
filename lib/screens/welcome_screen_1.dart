import 'package:flutter/material.dart';
import 'package:workout_generator/screens/welcome_screen_2.dart';

import 'goal_selection_screen.dart';

class WelcomeScreen1 extends StatelessWidget {
  const WelcomeScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to Workout Generator!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Get personalized workouts tailored to your goals and equipment.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomeScreen2()),
                );
              },
              child: const Text('Next'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Spacer(),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const GoalSelectionScreen()),
                    );
                  },
                  child: const Text('Skip'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
