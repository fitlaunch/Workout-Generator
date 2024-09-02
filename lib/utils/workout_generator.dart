import 'package:workout_generator/data/exercise_data.dart';
import 'package:workout_generator/models/exercise.dart';
import 'package:workout_generator/utils/exercise_selector.dart';
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

  print('Generated workout:');
  for (var exercise in generatedWorkout) {
    String advancedSetInfo = '';
    if (exercise.isAdvancedSet) {
      advancedSetInfo = ' (${exercise.advancedSetType})';
    }
    print(' - ${exercise.name}$advancedSetInfo');
  }

  return generatedWorkout;
}