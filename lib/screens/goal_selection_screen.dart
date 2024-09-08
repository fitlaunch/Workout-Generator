import 'package:flutter/material.dart';
import 'package:workout_generator/constants/app_constants.dart';
import 'package:workout_generator/screens/workout_details_screen.dart';
import 'package:workout_generator/utils/workout_generator.dart';

class GoalSelectionScreen extends StatefulWidget {
  const GoalSelectionScreen({super.key});

  @override
  _GoalSelectionScreenState createState() => _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
  String _selectedGoal = 'Strength'; // Default selection
  String _selectedEquipment = 'Home Gym'; // Default selection
  String _selectedDuration = workoutDurations[0];
  // int _selectedDaysPerWeek = daysPerWeekOptions[1]; // Add this back when needed

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    //  final w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        onPressed: () {},
        child: PopupMenuButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
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
                  Icons.short_text,
                  color: Colors.white,
                ),
                title: Text(
                  'Short Random Workout',
                  style: TextStyle(
                    fontSize: h * .025,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: const Icon(
                  Icons.receipt_long,
                  color: Colors.white,
                ),
                title: Text(
                  'Long Random Workout',
                  style: TextStyle(
                    fontSize: h * .025,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            PopupMenuItem(
              child: ListTile(
                leading: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                title: Text(
                  'My Account',
                  style: TextStyle(
                    fontSize: h * .025,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Workout Generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 50),
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
            // const SizedBox(height: 30),
            // const Text('Days per Week:', style: TextStyle(fontSize: 18)),
            // DropdownButton<int>(
            //   value: _selectedDaysPerWeek,
            //   onChanged: (int? newValue) {
            //     setState(() {
            //       _selectedDaysPerWeek = newValue!;
            //     });
            //   },
            //   items: daysPerWeekOptions.map<DropdownMenuItem<int>>((int value) {
            //     return DropdownMenuItem<int>(
            //       value: value,
            //       child: Text(value.toString()),
            //     );
            //   }).toList(),
            // ),
            const SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                // Generate the workout
                final workout = generateWorkout(
                  _selectedEquipment,
                  selectedGoal: _selectedGoal,
                  selectedDuration: _selectedDuration,
                );
                print('Generated workout: $workout');

                // Navigate to WorkoutDetailsScreen and pass the workout data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkoutDetailsScreen(
                      selectedGoal: _selectedGoal,
                      selectedDuration: _selectedDuration,
                      selectedEquipment: _selectedEquipment,
                      // selectedDaysPerWeek: _selectedDaysPerWeek, // Add this back when needed
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


// import 'package:flutter/material.dart';
// import 'package:workout_generator/constants/app_constants.dart';
// import 'package:workout_generator/screens/duration_selection_screen.dart'; // Import the next screen
//
// class GoalSelectionScreen extends StatefulWidget {
//   const GoalSelectionScreen({super.key});
//
//   @override
//   _GoalSelectionScreenState createState() => _GoalSelectionScreenState();
// }
//
// class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
//   String _selectedGoal = 'Strength'; // Default selection
//   String _selectedEquipment = 'Home Gym'; // Default selection
//
//   @override
//   Widget build(BuildContext context) {
//     final h = MediaQuery.of(context).size.height;
//   //  final w = MediaQuery.of(context).size.width;
//   return Scaffold(
//     floatingActionButton: FloatingActionButton(
//       backgroundColor: Colors.blueAccent,
//       onPressed: () {},
//       child: PopupMenuButton(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
//         color: Colors.blueAccent,
//         icon: Icon(
//           Icons.api_rounded,
//           color: Colors.white,
//           size: h * .04,
//         ),
//         position: PopupMenuPosition.over,
//         offset: const Offset(-42.0, -120.0), // Adjust vertical offset of FAB open),
//         itemBuilder: (BuildContext context) => [
//           PopupMenuItem(
//             child: ListTile(
//               leading: const Icon(
//                 Icons.short_text,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 'Short Random Workout',
//                 style: TextStyle(fontSize: h * .025, color: Colors.white, ),
//               ),
//             ),
//           ),
//           PopupMenuItem(
//             child: ListTile(
//               leading: const Icon(
//                 Icons.receipt_long,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 'Long Random Workout',
//                 style: TextStyle(fontSize: h * .025, color: Colors.white, ),
//               ),
//             ),
//           ),
//           PopupMenuItem(
//             child: ListTile(
//               leading: const Icon(
//                 Icons.person,
//                 color: Colors.white,
//               ),
//               title: Text(
//                 'My Account',
//                 style: TextStyle(fontSize: h * .025, color: Colors.white, ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     ),
//       appBar: AppBar(
//         title: const Text('Select Your Goal & Equipment'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const SizedBox(height: 20),
//             const Text('Select your workout goal:',
//                 style: TextStyle(fontSize: 18)),
//             DropdownButton<String>(
//               value: _selectedGoal,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedGoal = newValue!;
//                 });
//               },
//               items: workoutGoals.map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 30),
//             const Text(
//               'Select your equipment option:',
//               style: TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 20),
//             DropdownButton<String>(
//               value: _selectedEquipment,
//               onChanged: (String? newValue) {
//                 setState(() {
//                   _selectedEquipment = newValue!;
//                 });
//               },
//               items: equipmentOptions
//                   .map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 // Navigate to the DurationSelectionScreen and pass the selected goal and equipment
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DurationSelectionScreen(
//                       selectedGoal: _selectedGoal,
//                       selectedEquipment: _selectedEquipment,
//                     ),
//                   ),
//                 );
//               },
//               child: const Text('Next'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
