import 'package:flutter/material.dart';
import 'package:workout_generator/constants/app_constants.dart';
import 'package:workout_generator/screens/workout_details_screen.dart';
import 'package:workout_generator/utils/workout_generator.dart';

class DurationSelectionScreen extends StatefulWidget {
  final String selectedGoal;
  final String selectedEquipment;

  const DurationSelectionScreen({
    super.key,
    required this.selectedGoal,
    required this.selectedEquipment,
  });

  @override
  _DurationSelectionScreenState createState() =>
      _DurationSelectionScreenState();
}

class _DurationSelectionScreenState extends State<DurationSelectionScreen> {
  String _selectedDuration = workoutDurations[0];
  int _selectedDaysPerWeek = daysPerWeekOptions[1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Duration & Days per Week'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text('Workout Duration:', style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedDuration,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedDuration = newValue!;
                });
              },
              items: workoutDurations
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            const Text('Days per Week:', style: TextStyle(fontSize: 18)),
            DropdownButton<int>(
              value: _selectedDaysPerWeek,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedDaysPerWeek = newValue!;
                });
              },
              items: daysPerWeekOptions.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Generate the workout
                final workout = generateWorkout(
                  widget.selectedEquipment,
                  selectedGoal: widget.selectedGoal,
                  selectedDuration: _selectedDuration,
                );
                print('Generated workout: $workout');

                // Navigate to WorkoutDetailsScreen and pass the workout data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutDetailsScreen(
                      selectedGoal: widget.selectedGoal,
                      selectedDuration: _selectedDuration,
                      selectedEquipment: widget.selectedEquipment,
                      selectedDaysPerWeek: _selectedDaysPerWeek,
                      generatedWorkout: workout, // Pass the generated workout
                    ),
                  ),
                );
              },
              child: const Text('Generate My Workout'),
            ),
          ],
        ),
      ),
    );
  }
}
