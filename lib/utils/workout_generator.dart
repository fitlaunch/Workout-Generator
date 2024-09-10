import 'package:workout_generator/data/exercise_data.dart';
import 'package:workout_generator/models/exercise.dart';
import 'package:workout_generator/utils/exercise_selector.dart';
import 'package:workout_generator/utils/set_rep_generator.dart';
import 'package:workout_generator/utils/template_selector.dart';

List<Exercise> generateWorkout(
    String selectedEquipment, {
      required String selectedGoal,
      required String selectedDuration,
    }) {
  final template =
  getTemplateByKey(selectedEquipment, selectedGoal, selectedDuration);
  print('Selected template: $template');

  final generatedWorkout = selectExercisesForWorkout(
    exercises,
    template,
    selectedEquipment,
    selectedGoal,
  );

  // Add sets, reps, and rest based on goal and handle advanced set rest
  for (int i = 0; i < generatedWorkout.length; i++) {
    Exercise exercise = generatedWorkout[i];
    bool isPrimary = exercise.position.contains('Primary');
    Map<String, dynamic> details = SetRepGenerator.generateExerciseDetails(selectedGoal, isPrimary);

    if (exercise.isAdvancedSet) {
      // Find the next exercise in the advanced set
      int nextIndex = i + 1;
      while (nextIndex < generatedWorkout.length && generatedWorkout[nextIndex].isAdvancedSet) {
        nextIndex++;
      }

      // If there's another exercise in the advanced set, ensure they have the same sets and set rest to 0-20 seconds
      if (nextIndex < generatedWorkout.length) {
        // Get sets from details if it's the first exercise in the set, otherwise use the previous exercise's sets
        int sets = details['sets'];
        if (i > 0 && generatedWorkout[i - 1].isAdvancedSet) {
          sets = int.parse(generatedWorkout[i - 1].sets);
        }
        details['sets'] = sets;
        if (nextIndex != i + 1){  //check that not last exercise in advanced set
          exercise.rest = '0-20 seconds';
        }

      }
    }

    exercise.sets = details['sets'].toString();
    exercise.reps = details['reps'].toString();
    if (exercise.rest.isEmpty) {
      exercise.rest = details['rest'];
    }
  }

  print('Generated workout:');
  for (var exercise in generatedWorkout) {
    String advancedSetInfo = '';
    if (exercise.isAdvancedSet) {
      advancedSetInfo = ' (${exercise.advancedSetType})';
    }
    print(' - ${exercise.name}$advancedSetInfo, Sets: ${exercise.sets}, Reps: ${exercise.reps}, Rest: ${exercise.rest}');
  }

  return generatedWorkout;
}