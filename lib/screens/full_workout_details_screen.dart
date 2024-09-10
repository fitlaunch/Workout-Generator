import 'package:flutter/material.dart';

import '../models/exercise.dart';

class FullWorkoutDetailsScreen extends StatelessWidget {
  final List<Exercise> generatedWorkout;

  const FullWorkoutDetailsScreen({super.key, required this.generatedWorkout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full Workout Details'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal, // Horizontal scrolling
            child: Row(
              children: generatedWorkout.map((exercise) {
                return _buildExerciseDetailsCard(exercise);
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExerciseDetailsCard(Exercise exercise) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Container(
        width: 270, // Adjust card width as needed
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exercise.name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Add more details here (e.g., description, sets, reps, images)
            Text('Description: ${exercise.description}'),
            //Text('Sets: ${exercise.sets}'),
            //Text('Reps: ${exercise.reps}'),
            // You can add images or other details as needed
          ],
        ),
      ),
    );
  }
}