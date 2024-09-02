import 'dart:math';

import 'package:workout_generator/models/exercise.dart';

// Define maps to associate goals with their advanced set probabilities
const Map<String, double> goalSupersetProbabilities = {
  'Strength': 0.15,
  'Hypertrophy': 0.3,
  'Endurance': 0.05,
  'Metabolic': 0.2,
};

const Map<String, double> goalMiniCircuitProbabilities = {
  'Strength': 0.05,
  'Hypertrophy': 0.1,
  'Endurance': 0.0,
  'Metabolic': 0.1,
};

// Function to select exercises for a workout
List<Exercise> selectExercisesForWorkout(
    List<Exercise> exercises,
    List<String> template,
    String selectedEquipment,
    String selectedGoal,
    ) {
  final List<Exercise> generatedWorkout = [];
  final Random random = Random();

  print('Template content: ${template.join(", ")}');

  exercises.shuffle();

  final filteredExercises = exercises.where((exercise) {
    bool isSettingMatch = exercise.settings
        .any((s) => s.toLowerCase() == selectedEquipment.toLowerCase());
    bool isPositionMatch = exercise.position.any((p) => template.contains(p));
    bool isFinisherMatch =
    (!exercise.finisherOnly || template.contains('Finisher'));

    return isSettingMatch && isPositionMatch && isFinisherMatch;
  }).toList();

  print('Filtered exercises count: ${filteredExercises.length}');

  final supersetProbability = goalSupersetProbabilities[selectedGoal] ?? 0.2;
  final miniCircuitProbability = goalMiniCircuitProbabilities[selectedGoal] ?? 0.1;

  int positionsFilled = 0;

  for (final position in template) {
    final eligibleExercises = filteredExercises.where((exercise) {
      return exercise.position.contains(position) &&
          !generatedWorkout.any((e) => e.name == exercise.name);
    }).toList();

    print('Selecting exercise for position: $position');
    print('Eligible exercises: ${eligibleExercises.map((e) => e.name).toList()}');

    if (eligibleExercises.isEmpty) {
      print('No suitable exercises found for position: $position');
      continue;
    }

    if (position == 'Secondary' &&
        positionsFilled < template.length &&
        random.nextDouble() < supersetProbability) {
      final advancedSetExercises = _selectExercisesForAdvancedSet(
        eligibleExercises,
        2,
        ensureVariety: true,
        advancedSetType: 'superset',
      );
      generatedWorkout.addAll(advancedSetExercises);
    } else if (position == 'Secondary' &&
        positionsFilled < template.length &&
        random.nextDouble() < miniCircuitProbability) {
      final miniCircuitExercises = _selectExercisesForAdvancedSet(
        eligibleExercises,
        3,
        ensureVariety: true,
        advancedSetType: 'mini-circuit',
      );
      generatedWorkout.addAll(miniCircuitExercises);
    } else {
      final selectedExercise =
      eligibleExercises[random.nextInt(eligibleExercises.length)];

      print('Candidate exercise: ${selectedExercise.name}, passesVarietyCheck: true');

      generatedWorkout.add(selectedExercise);
    }

    positionsFilled++;
  }

  return generatedWorkout;
}

// Helper function to select exercises for advanced sets
List<Exercise> _selectExercisesForAdvancedSet(
    List<Exercise> eligibleExercises,
    int numExercises, {
      bool ensureVariety = false,
      required String advancedSetType,
    }) {
  final selectedExercises = <Exercise>[];
  final random = Random();
  final usedExerciseNames = <String>{}; // Keep track of used exercise names

  int attempts = 0;
  const int maxAttempts = 100;

  while (selectedExercises.length < numExercises && attempts < maxAttempts) {
    final candidateExercise =
    eligibleExercises[random.nextInt(eligibleExercises.length)];

    // Check if exercise name has already been used
    bool passesNameCheck = !usedExerciseNames.contains(candidateExercise.name);

    bool passesVarietyCheck = !ensureVariety ||
        !selectedExercises.any((e) => e.categories.any(
                (category) => candidateExercise.categories.contains(category)));

    print('Candidate exercise: ${candidateExercise.name}, passesVarietyCheck: $passesVarietyCheck');
    if (!passesVarietyCheck) {
      print('Variety check failed. Reason: Categories overlap');
    }

    // if (passesNameCheck && passesVarietyCheck) {
    //   candidateExercise.isAdvancedSet = true;
    //   candidateExercise.advancedSetType = advancedSetType;
    //   selectedExercises.add(candidateExercise);
    if (passesNameCheck && passesVarietyCheck) {
      final Exercise selectedExercise = candidateExercise.copyWith(
        isAdvancedSet: true,
        advancedSetType: advancedSetType,
      );
      selectedExercises.add(selectedExercise);
      usedExerciseNames.add(candidateExercise.name);
    }



    attempts++;
  }

  if (attempts >= maxAttempts) {
    print(
        'Could not find enough exercises with variety for advanced set. Selecting without variety.');
    selectedExercises.clear();
    usedExerciseNames.clear(); // Clear used names if variety fails
    while (selectedExercises.length < numExercises) {
      final candidateExercise =
      eligibleExercises[random.nextInt(eligibleExercises.length)];

      // Check for duplicate names even when variety is not enforced
      if (!usedExerciseNames.contains(candidateExercise.name)) {
        candidateExercise.isAdvancedSet = true;
        candidateExercise.advancedSetType = advancedSetType;
        selectedExercises.add(candidateExercise);
        usedExerciseNames.add(candidateExercise.name);
      }
    }
  }

  print('Selected exercises for advanced set:');
  for (var exercise in selectedExercises) {
    print(
        ' - ${exercise.name} (isAdvancedSet: ${exercise.isAdvancedSet}, advancedSetType: ${exercise.advancedSetType})');
  }

  return selectedExercises;
}