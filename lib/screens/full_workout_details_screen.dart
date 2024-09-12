import 'package:flutter/material.dart';

import '../models/exercise.dart';
import '../themes/workout_card_styles.dart';

class FullWorkoutDetailsScreen extends StatefulWidget {
  final List<Exercise> generatedWorkout;

  const FullWorkoutDetailsScreen({super.key, required this.generatedWorkout});

  @override
  State<FullWorkoutDetailsScreen> createState() =>
      _FullWorkoutDetailsScreenState();
}

class _FullWorkoutDetailsScreenState extends State<FullWorkoutDetailsScreen> {
  late List<bool> _isCompletedList;

  @override
  void initState() {
    super.initState();
    _isCompletedList =
        List.generate(widget.generatedWorkout.length, (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Generated Workout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: _buildWorkoutDisplay(
                        context, widget.generatedWorkout),
                  ),
                ),
              ),
            ),
          ),
          _buildWorkoutProgressIndicator(widget.generatedWorkout),
        ],
      ),
    );
  }

  List<Widget> _buildWorkoutDisplay(BuildContext context,
      List<Exercise> workout) {
    List<Widget> displayWidgets = [];
    int i = 0;
    int advancedSetIndex = 0;

    while (i < workout.length) {
      final exercise = workout[i];

      if (exercise.isAdvancedSet) {
        int advancedSetSize =
        (exercise.advancedSetType == 'mini-circuit') ? 3 : 2;
        int endIndex = i + advancedSetSize;

        if (endIndex <= workout.length) {
          displayWidgets.addAll(_buildAdvancedSet(
            workout.sublist(i, endIndex),
            _getStyleForAdvancedSet(advancedSetIndex),
            _getIconForAdvancedSetGroup(_getAdvancedSetGroup(advancedSetIndex)),
            _getAdvancedSetGroup(advancedSetIndex),
            i,
          ));
          i = endIndex;
          advancedSetIndex++;
        } else {
          print("Not enough exercises left for a complete advanced set.");
          break;
        }
      } else {
        displayWidgets.add(_buildExerciseDetailsCard(
          exercise,
          defaultCardStyle,
          null,
          '',
          i,
        ));
        i++;
      }
    }

    return displayWidgets;
  }

  List<Widget> _buildAdvancedSet(
      List<Exercise> advancedSetExercises,
      CardStyle style,
      Icon icon,
      String advancedSetGroup,
      int startIndex,
      ) {
    return advancedSetExercises.asMap().entries.map((entry) {
      final index = entry.key + startIndex;
      final exercise = entry.value;

      return Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: _buildExerciseDetailsCard(
          exercise,
          style,
          icon,
          advancedSetGroup,
          index,
        ),
      );
    }).toList();
  }

  Widget _buildExerciseDetailsCard(Exercise exercise,
      CardStyle cardStyle,
      Icon? icon,
      String advancedSetGroup,
      int index,) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: cardStyle.borderColor, width: 2.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 230,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    exercise.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (icon != null && advancedSetGroup.isNotEmpty)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      icon,
                      const SizedBox(width: 4),
                      Text(
                        advancedSetGroup,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Sets: ${exercise.sets}'),
            Text('Reps: ${exercise.reps}'),
            Text('Rest: ${exercise.rest}'),
            const SizedBox(height: 8),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isCompletedList[index] = !_isCompletedList[index];
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isCompletedList[index]
                      ? Colors.green.shade300
                      : Colors.blue.shade300,
                  foregroundColor: Colors.white,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: 0,
                ),
                child: Text(_isCompletedList[index]
                    ? 'Completed!'
                    : 'Mark as Complete',),
              ),
            ),
            const SizedBox(height: 8),
            Text(exercise.description ?? ''),
            const SizedBox(height: 8),
            Text(
              'Equipment: ${exercise.equipment }',  //?? ''
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkoutProgressIndicator(List<Exercise> workout) {
    int completedExercises = _isCompletedList
        .where((completed) => completed)
        .length;
    double progress = completedExercises / workout.length;
    int percentage = (progress * 100).toInt();

    return Stack(
      alignment: Alignment.center,
      children: [
        LinearProgressIndicator(
          value: progress,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
          minHeight: 10,
        ),
        Text('$percentage%',
          style: const TextStyle(fontSize: 12, color: Colors.black38),),
      ],
    );
  }

  CardStyle _getStyleForAdvancedSet(int index) {
    return advancedCardStyle[index % advancedCardStyle.length];
  }

  Icon _getIconForAdvancedSetGroup(String group) {
    switch (group) {
      case 'A':
        return const Icon(Icons.swap_horiz);
      case 'B':
        return const Icon(Icons.swap_vert);
      case 'C':
        return const Icon(Icons.repeat);
      case 'D':
        return const Icon(Icons.swap_calls);
      case 'E':
        return const Icon(Icons.cached);
      default:
        return const Icon(Icons.question_mark);
    }
  }

  String _getAdvancedSetGroup(int index) {
    const groups = ['A', 'B', 'C', 'D', 'E'];
    return groups[index % groups.length];
  }
}