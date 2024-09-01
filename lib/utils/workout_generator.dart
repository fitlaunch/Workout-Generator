import 'dart:math';

import 'package:workout_generator/data/exercise_data.dart';
import 'package:workout_generator/models/exercise.dart';
import 'package:workout_generator/utils/template_selector.dart';

// Define maps to associate goals with their advanced set probabilities
const Map<String, double> goalSupersetCompoundSetProbabilities = {
  'Strength': 0.15,
  'Hypertrophy': 0.3,
  'Endurance': 0.05,
  'Metabolic': 0.2,
  // Add more goals and probabilities as needed
};

const Map<String, double> goalMiniCircuitProbabilities = {
  'Strength': 0.05,
  'Hypertrophy': 0.1,
  'Endurance': 0.0,
  'Metabolic': 0.1,
  // Add more goals and probabilities as needed
};

List<Exercise> generateWorkout(
  String selectedEquipment, {
  required String selectedGoal,
  required String selectedDuration,
}) {
  final List<Exercise> generatedWorkout = [];
  final Random random = Random();

  // Get the appropriate template based on user selections
  final template =
      getTemplateByKey(selectedEquipment, selectedGoal, selectedDuration);
  print('Selected template: $template');

  // Print the content of the template
  print('Template content: ${template.join(", ")}');

  // Filter exercises based on equipment and goal
  final filteredExercises = exercises.where((exercise) {
    bool isSettingMatch = exercise.settings
        .any((s) => s.toLowerCase() == selectedEquipment.toLowerCase());
    bool isPositionMatch = exercise.position.any((p) => template.contains(p));
    bool isFinisherMatch =
        (!exercise.finisherOnly || template.contains('Finisher'));

    print(
        'Exercise: ${exercise.name}, isSettingMatch: $isSettingMatch, isPositionMatch: $isPositionMatch, isFinisherMatch: $isFinisherMatch');

    return isSettingMatch && isPositionMatch && isFinisherMatch;
  }).toList();

  print('Filtered exercises count: ${filteredExercises.length}');
  print(
      'Filtered exercises: $filteredExercises'); // Optional, for detailed inspection

  // Get the advanced set probabilities for the selected goal
  final supersetCompoundSetProbability =
      goalSupersetCompoundSetProbabilities[selectedGoal] ?? 0.22;
  final miniCircuitProbability =
      goalMiniCircuitProbabilities[selectedGoal] ?? 0.1;

  int positionsFilled = 0;

  // Iterate through the template
  for (final position in template) {
    final eligibleExercises = filteredExercises.where((exercise) {
      return exercise.position.contains(position) &&
          !generatedWorkout.any((e) => e.name == exercise.name);
    }).toList();

    print('Eligible exercises for position $position: $eligibleExercises');

    if (eligibleExercises.isEmpty) {
      print('No suitable exercises found for position: $position');
      continue;
    }

    if (position == 'Secondary' &&
        positionsFilled < template.length &&
        random.nextDouble() <
            (supersetCompoundSetProbability + miniCircuitProbability)) {
      final isSupersetOrCompoundSet = random.nextDouble() <
          (supersetCompoundSetProbability /
              (supersetCompoundSetProbability + miniCircuitProbability));

      if (isSupersetOrCompoundSet) {
        // Generate a superset or compound set (2 exercises)
        final advancedSetExercises = _selectExercisesForAdvancedSet(
          eligibleExercises,
          2,
          ensureVariety: true,
        );
        generatedWorkout.addAll(advancedSetExercises);
      } else {
        final isMiniCircuit = random.nextDouble() < 0.1;

        if (isMiniCircuit) {
          // Generate a mini-circuit (3 exercises)
          print('Generating mini-circuit');
          final miniCircuitExercises = _selectExercisesForAdvancedSet(
            eligibleExercises,
            3,
            ensureVariety: true,
          );
          print('Selected exercises for mini-circuit: $miniCircuitExercises');
          generatedWorkout.addAll(miniCircuitExercises);
        } else {
          // Select a single exercise if not any advanced set type
          final selectedExercise =
              eligibleExercises[random.nextInt(eligibleExercises.length)];
          generatedWorkout.add(selectedExercise);
        }
      }

      positionsFilled++;
    } else {
      // Select a single exercise for other positions (Primary, Finisher)
      final selectedExercise =
          eligibleExercises[random.nextInt(eligibleExercises.length)];
      generatedWorkout.add(selectedExercise);
      positionsFilled++;
    }
  }

  return generatedWorkout;
}

// Helper function to select exercises for advanced sets
List<Exercise> _selectExercisesForAdvancedSet(
  List<Exercise> eligibleExercises,
  int numExercises, {
  bool ensureVariety = false,
}) {
  final selectedExercises = <Exercise>[];
  final random = Random();

  int attempts = 0; // Add a counter to track attempts
  const int maxAttempts =
      100; // Set a maximum number of attempts to prevent infinite loops

  while (selectedExercises.length < numExercises && attempts < maxAttempts) {
    final candidateExercise =
        eligibleExercises[random.nextInt(eligibleExercises.length)];

    bool passesVarietyCheck = !ensureVariety ||
        !selectedExercises.any(
            (e) => e.categories.any(candidateExercise.categories.contains));

    print(
        'Candidate exercise: ${candidateExercise.name}, passesVarietyCheck: $passesVarietyCheck');
    print('Current selectedExercises: $selectedExercises');

    if (passesVarietyCheck) {
      selectedExercises.add(candidateExercise);
    }

    attempts++;
  }

  // If we reach maxAttempts, it means we couldn't find enough exercises with variety
  if (attempts >= maxAttempts) {
    print(
        'Could not find enough exercises with variety for advanced set. Selecting without variety.');
    // You might want to handle this differently, maybe by relaxing the variety constraint or providing a message to the user
    selectedExercises
        .clear(); // Clear the list and start over without ensuring variety
    while (selectedExercises.length < numExercises) {
      final candidateExercise =
          eligibleExercises[random.nextInt(eligibleExercises.length)];
      selectedExercises.add(candidateExercise);
    }
  }

  return selectedExercises;
}
