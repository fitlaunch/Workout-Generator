import 'package:flutter/material.dart';

import '../models/exercise.dart';
import '../themes/exercise_card.dart';
import '../themes/workout_card_styles.dart';
import 'goal_selection_screen.dart';

class WorkoutDetailsScreen extends StatelessWidget {
  final String selectedGoal;
  final String selectedDuration;
  final String selectedEquipment;
 // final int selectedDaysPerWeek;
  final List<Exercise> generatedWorkout;

  const WorkoutDetailsScreen({
    super.key,
    required this.selectedGoal,
    required this.selectedDuration,
    required this.selectedEquipment,
    //required this.selectedDaysPerWeek,
    required this.generatedWorkout,
  });



  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
  //  final w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {},
        child: PopupMenuButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
          color: Colors.blueAccent,
          icon: Icon(
            Icons.api_rounded,
            color: Colors.white,
            size: h * .04,
          ),
          position: PopupMenuPosition.over,
          offset: const Offset(-42.0, -120.0), // Adjust vertical offset of FAB open),
          itemBuilder: (BuildContext context) => [
            PopupMenuItem(
              child: ListTile(
                leading: const Icon(
                  Icons.fit_screen_rounded,
                  color: Colors.white,
                ),
                title: Text(
                  'Generate Random',
                  style: TextStyle(fontSize: h * .025, color: Colors.white, fontWeight: FontWeight.bold,),
                ),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
                title: Text(
                  'Account',
                  style: TextStyle(fontSize: h * .025, color: Colors.white, fontWeight: FontWeight.bold,),
                ),
              ),
            ),
          ],
        ),
      ),
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
              // Text(
              //   'Days per Week: $selectedDaysPerWeek',
              //   style: const TextStyle(fontSize: 16),
              // ),
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
  List<Widget> _buildWorkoutDisplay(BuildContext context, List<Exercise> workout) {
    List<Widget> displayWidgets = [];
    int i = 0;
    int advancedSetIndex =0;

    while (i < workout.length) {
      final exercise = workout[i];

      if (exercise.isAdvancedSet) {
        // Determine the size of the advanced set based on its type
        int advancedSetSize = (exercise.advancedSetType == 'mini-circuit') ? 3 : 2;
        int endIndex = i + advancedSetSize;

        // Check if there's enough space for the advanced set
        if (endIndex <= workout.length) {
          // Process the advanced set
          displayWidgets.addAll(_buildAdvancedSet(
            workout.sublist(i, endIndex),
            _getStyleForAdvancedSet(advancedSetIndex),  // Provide unique styles for each advanced set

            _getIconForAdvancedSetGroup(_getAdvancedSetGroup(advancedSetIndex)),  // Provide icons based on the group
            _getAdvancedSetGroup(advancedSetIndex),  // Determine the group for advanced set
          ));
          i = endIndex;  // Move the index past the advanced set
          advancedSetIndex++;  // Increment the advanced set index
        } else {
          // Not enough exercises left for a complete advanced set
          print("Not enough exercises left for a complete advanced set.");
          break;  // Exit the loop if not enough exercises are left
        }
      } else {
        // If not an advanced set, simply add the exercise
        displayWidgets.add(ExerciseCard(
          exercise: exercise,
          cardStyle: defaultCardStyle,
        ));
        i++;
      }
    }

    return displayWidgets;
  }

// Helper function to build widgets for an advanced set
  List<Widget> _buildAdvancedSet(
      List<Exercise> advancedSetExercises,
      CardStyle style,
      Icon icon,
      String advancedSetGroup) {
    return advancedSetExercises.map((exercise) {
      return ExerciseCard(
        exercise: exercise,
        cardStyle: style,
        icon: icon,
        isIndented: true,
        advancedSetGroup: advancedSetGroup,
      );
    }).toList();
  }

// Functions for providing styles, icons, and groups
  CardStyle _getStyleForAdvancedSet(int index) {
    // Example logic for cycling styles
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
    // Rotate groups based on index
    const groups = ['A', 'B', 'C', 'D', 'E'];
    return groups[index % groups.length];
  }
}