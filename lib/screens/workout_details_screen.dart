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
    int advancedSetCount = 0; // Keep track of advanced set count

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
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: const BorderSide(color: Colors.blue, width: 2.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(primaryExercise.name,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Category: ${primaryExercise.categories.join(', ')}'),
                Text('Equipment: ${primaryExercise.equipment.join(', ')}'),
                if (primaryExercise.description != null)
                  Text('Description: ${primaryExercise.description}'),
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

      // Reset advancedSetCount only if the previous exercise was NOT part of an advanced set
      if (i > 0 && !workout[i - 1].isAdvancedSet) {
        advancedSetCount = 0;
      }

      if (exercise.position.contains('Finisher')) {
        // Always display the 'Finisher' exercise at the end
        displayWidgets.add(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.blue, width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exercise.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
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
      } else if (exercise.isAdvancedSet) {
        // Only increment advancedSetCount if this is the start of a new advanced set
        if (i == 0 || !workout[i - 1].isAdvancedSet) {
          advancedSetCount++;
        }

        // Determine border color based on advanced set count
        Color borderColor;
        if (advancedSetCount == 1) {
          borderColor = Colors.green;
        } else if (advancedSetCount == 2) {
          borderColor = Colors.purple;
        } else {
          borderColor = Colors.red;
        }

        final iconColor = _getColorForAdvancedSet(exercise.advancedSetType);
        final backgroundColor = Colors.white; // Set background to white

        displayWidgets.add(
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            margin: EdgeInsets.only(left: exercise.isAdvancedSet ? 16.0 : 0.0),
            child: Card(
              color: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: borderColor, width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(exercise.name,
                              style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text('Category: ${exercise.categories.join(', ')}'),
                          Text('Equipment: ${exercise.equipment.join(', ')}'),
                          if (exercise.description != null)
                            Text('Description: ${exercise.description}'),
                          const Text('Sets: 3, Reps: 12-15'),
                        ],
                      ),
                    ),
                    // Show the icon for all exercises in the mini-circuit
                    if (exercise.isAdvancedSet &&
                        exercise.advancedSetType == 'mini-circuit')
                      Icon(Icons.swap_horiz, color: iconColor),
                  ],
                ),
              ),
            ),
          ),
        );
      } else {
        // Display other exercises with a blue border
        displayWidgets.add(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.blue, width: 2.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exercise.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
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

    // Ensure we have enough lines for visual consistency
    const maxExercises = 10;
    if (displayWidgets.length < maxExercises) {
      while (displayWidgets.length < maxExercises) {
        displayWidgets.add(const SizedBox(height: 20));
      }
    }

    return displayWidgets;
  }

// Helper function to get color for advanced sets
  Color _getColorForAdvancedSet(String? advancedSetType) {
    switch (advancedSetType) {
      case 'superset':
        return Colors.blue;
      case 'mini-circuit':
        return Colors.green;
      default:
        return Colors.black; // Or a default color for single exercises
    }
  }
}
