import 'package:flutter/material.dart';

import '../models/exercise.dart';
import 'goal_selection_screen.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  final String selectedGoal;
  final String selectedDuration;
  final String selectedEquipment;
  final int selectedDaysPerWeek;
  final List<Exercise> generatedWorkout;

  const WorkoutDetailsScreen({
    super.key,
    required this.selectedGoal,
    required this.selectedDuration,
    required this.selectedEquipment,
    required this.selectedDaysPerWeek,
    required this.generatedWorkout,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Details'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Selection Summary',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                'Goal: $selectedGoal',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Equipment: $selectedEquipment',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Duration: $selectedDuration',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Days per Week: $selectedDaysPerWeek',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const GoalSelectionScreen()),
                    (route) => false,
                  );
                },
                child: const Text('Rebuild'),
              ),
              const SizedBox(height: 30),

              // Display the generated workout
              if (generatedWorkout.isEmpty)
                const Text(
                    'No workout generated. Please try a different option.')
              else
                Column(
                  children: _buildWorkoutDisplay(context, generatedWorkout),
                ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build the workout display
  List<Widget> _buildWorkoutDisplay(
      BuildContext context, List<Exercise> workout) {
    List<Widget> displayWidgets = [];
    int advancedSetCount = 0;

    // Find and display the 'Primary' exercise first, handling the case where it might not exist
    final primaryExercise = workout.firstWhere(
      (exercise) => exercise.position.contains('Primary'),
      orElse: () => Exercise(
        name: 'No primary exercise found',
        categories: [],
        settings: [],
        equipment: [],
        position: ['Primary'],
      ),
    );

    displayWidgets.add(
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(primaryExercise.name,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Category: ${primaryExercise.categories.join(', ')}'),
                Text('Equipment: ${primaryExercise.equipment.join(', ')}'),
                if (primaryExercise.description != null)
                  Text('Description: ${primaryExercise.description}'),
                // You might want to adjust the sets and reps display based on whether a primary exercise was actually found
                const Text('Sets: 3, Reps: 10'),
              ],
            ),
          ),
        ),
      ),
    );

    // Process the remaining exercises
    for (int i = 1; i < workout.length; i++) {
      final exercise = workout[i];
      print(
          'Processing exercise: ${exercise.name} with positions: ${exercise.position} isAdvanced: ${exercise.isAdvanced}');

      if (exercise.position.contains('Finisher')) {
        // Always display the 'Finisher' exercise at the end
        displayWidgets.add(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exercise.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Category: ${exercise.categories.join(', ')}'),
                    Text('Equipment: ${exercise.equipment.join(', ')}'),
                    if (exercise.description != null)
                      Text('Description: ${exercise.description}'),
                    const Text('Sets: 3, Reps: 15'),
                  ],
                ),
              ),
            ),
          ),
        );
      } else if (exercise.isAdvanced) {
        if (i > 0 && !workout[i - 1].isAdvanced) {
          // Start of an advanced set
          advancedSetCount++;
        }

        // Display each exercise in the advanced set individually with an icon
        displayWidgets.add(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(exercise.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text('Category: ${exercise.categories.join(', ')}'),
                          Text('Equipment: ${exercise.equipment.join(', ')}'),
                          if (exercise.description != null)
                            Text('Description: ${exercise.description}'),
                          const Text('Sets: 3, Reps: 12-15'),
                        ],
                      ),
                    ),
                    // Add icon with color based on advancedSetCount for ALL exercises in the set
                    Icon(Icons.swap_horiz,
                        color: _getColorForAdvancedSet(advancedSetCount)),
                  ],
                ),
              ),
            ),
          ),
        );

        // If this is the last exercise in the advanced set, reset the counter
        if (i == workout.length - 1 || !workout[i + 1].isAdvanced) {
          advancedSetCount = 0;
        }
      } else {
        // Display other exercises using Card widgets with consistent width
        displayWidgets.add(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exercise.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Category: ${exercise.categories.join(', ')}'),
                    Text('Equipment: ${exercise.equipment.join(', ')}'),
                    if (exercise.description != null)
                      Text('Description: ${exercise.description}'),
                    const Text('Sets: 3, Reps: 10'),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    }

    // Ensure we have enough lines for visual consistency,
    // but only if there are fewer DISPLAYED exercises than the maximum
    final maxExercises = 10;
    if (displayWidgets.length < maxExercises) {
      while (displayWidgets.length < maxExercises) {
        displayWidgets.add(const SizedBox(height: 20));
      }
    }

    return displayWidgets;
  }

  // Helper function to get color for advanced sets
  Color _getColorForAdvancedSet(int count) {
    switch (count % 3) {
      case 0:
        return Colors.blue;
      case 1:
        return Colors.green;
      case 2:
        return Colors.orange;
      default:
        return Colors.black;
    }
  }
}
