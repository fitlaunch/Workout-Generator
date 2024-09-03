import 'package:flutter/material.dart';

import '../models/exercise.dart';
import '../themes/exercise_card.dart';
import '../themes/workout_card_styles.dart';
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
    bool isInAdvancedSet = false; // Add this flag

    for (int i = 0; i < workout.length; i++) {
      final exercise = workout[i];

      if (exercise.isAdvancedSet) {
        if (!isInAdvancedSet) { // Check if entering a new advanced set
          advancedSetCount++;
          isInAdvancedSet = true;
        }

        final cardStyle = advancedCardStyles[advancedSetCount - 1];
        final iconColor = _getColorForAdvancedSet(exercise.advancedSetType);

        displayWidgets.add(ExerciseCard(
          exercise: exercise,
          cardStyle: cardStyle,
          iconColor: iconColor,
          isIndented: true,
        ));
      } else {
        isInAdvancedSet = false; // Reset the flag

        displayWidgets.add(ExerciseCard(
          exercise: exercise,
          cardStyle: defaultCardStyle,
        ));
      }
    }

    return displayWidgets;
  }

// Helper function to get color for advanced sets
  Color _getColorForAdvancedSet(String? advancedSetType) {
    switch (advancedSetType) {
      case 'superset':
        return Colors.green;
      case 'mini-circuit':
        return Colors.purple;
      default:
        return Colors.blue; // Or a default color for single exercises
    }
  }
}
