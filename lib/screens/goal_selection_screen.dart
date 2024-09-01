import 'package:flutter/material.dart';
import 'package:workout_generator/constants/app_constants.dart';
import 'package:workout_generator/screens/duration_selection_screen.dart'; // Import the next screen

class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({super.key});

  @override
  _GoalSelectionScreenState createState() => _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
  String _selectedGoal = 'Strength'; // Default selection
  String _selectedEquipment = 'Home Gym'; // Default selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Your Goal & Equipment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            const Text('Select your workout goal:',
                style: TextStyle(fontSize: 18)),
            DropdownButton<String>(
              value: _selectedGoal,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedGoal = newValue!;
                });
              },
              items: workoutGoals.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            const Text(
              'Select your equipment option:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            DropdownButton<String>(
              value: _selectedEquipment,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedEquipment = newValue!;
                });
              },
              items: equipmentOptions
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Navigate to the DurationSelectionScreen and pass the selected goal and equipment
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DurationSelectionScreen(
                      selectedGoal: _selectedGoal,
                      selectedEquipment: _selectedEquipment,
                    ),
                  ),
                );
              },
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
