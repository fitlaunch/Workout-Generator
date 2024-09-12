import 'dart:ui';

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
  String _selectedGoal = 'Hypertrophy'; // Default selection
  String _selectedEquipment = 'Home Gym'; // Default selection
  String _selectedDuration = workoutDurations[1];
  final _scrollController = ScrollController();
  String _selectedWorkoutStyle = workoutStyle[0];  //selecting workout type
  // int _selectedDaysPerWeek = daysPerWeekOptions[1]; // Add this back when needed

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _scrollController.animateTo(
          15, // Initial scroll offset (adjust as needed)
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    },);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    //final w = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange[400],
        onPressed: () {
          // Generate the workout
          final workout = generateWorkout(
            _selectedEquipment,
            selectedGoal: _selectedGoal,
            selectedDuration: _selectedDuration,
            selectedWorkoutStyle: _selectedWorkoutStyle
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
                selectedWorkoutStyle: _selectedWorkoutStyle,
                // selectedDaysPerWeek: _selectedDaysPerWeek, // Add this back when needed
                generatedWorkout: workout, // Pass the generated workout
              ),
            ),
          );
        },
        child: const Icon(
          Icons.auto_awesome,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'Workout Generator',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white,), // Your desired menu icon
            onPressed: () {
              // Show the popup menu
              showMenu<String>(
                context: context,
                position: RelativeRect.fromLTRB(
                  MediaQuery.of(context).size.width -
                      100, // Adjust horizontal position
                  AppBar().preferredSize.height, // Adjust vertical position
                  0,
                  0,
                ),
                items: [
                  PopupMenuItem<String>(
                    value: 'short',
                    child: ListTile(
                      onTap: () {},
                      leading:
                          const Icon(Icons.short_text, color: Colors.black87),
                      title: Text(
                        'Short Random Workout',
                        style: TextStyle(
                            fontSize: h * .025, color: Colors.black87),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'long',
                    child: ListTile(
                      onTap: () {},
                      leading:
                          const Icon(Icons.receipt_long, color: Colors.black87),
                      title: Text(
                        'Long Random Workout',
                        style: TextStyle(
                            fontSize: h * .025, color: Colors.black87),
                      ),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'account',
                    child: ListTile(
                      onTap: () {},
                      leading: const Icon(Icons.person, color: Colors.black87),
                      title: Text(
                        'My Account',
                        style: TextStyle(
                            fontSize: h * .025, color: Colors.black87),
                      ),
                    ),
                  ),
                ],
              ).then((String? item) {
                if (item != null) {
                  // Handle menu item selection here
                  switch (item) {
                    case 'short':
                      // Action for Short Random Workout
                      break;
                    case 'long':
                      // Action for Long Random Workout
                      break;
                    case 'account':
                      // Action for My Account
                      break;
                  }
                }
              });
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/mb-gym.jpg',
            fit: BoxFit.cover, // Adjust the fit as needed
            height: double.infinity,
            width: double.infinity,
          ),
          BackdropFilter(
            filter:
                ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Adjust blur intensity
            child: Container(
              color: Colors.black
                  .withOpacity(0.5), // Add a semi-transparent overlay
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(height: 20),
                  // Target Selection with RadioButtons
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      height: 140, // Increased height for two rows
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepOrange.shade300, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Select Workout Style:',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: GridView.count(
                              crossAxisCount: 3,
                              childAspectRatio: 2.5,
                              //mainAxisSpacing: 1, // Add vertical spacing between rows
                              crossAxisSpacing: 4,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: workoutStyle.map((style) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedWorkoutStyle = style;
                                    });
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min, // Prevent Row from taking full width
                                    children: [
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Radio<String>(
                                          value: style,
                                          groupValue: _selectedWorkoutStyle,
                                          onChanged: (value) {
                                            setState(() {
                                              _selectedWorkoutStyle = value!;
                                            });
                                          },
                                          activeColor: Colors.deepOrange,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      ShaderMask( // Added ShaderMask
                                        shaderCallback: (bounds) => RadialGradient(
                                          center: Alignment.center,
                                          radius: 3.5,
                                          colors: _selectedWorkoutStyle == style
                                              ? [Colors.white, Colors.blueAccent.withOpacity(0.2)]
                                              : [Colors.white, Colors.white70],
                                          stops: const [0.8, 1.0],
                                        ).createShader(bounds),
                                        child: Text(
                                          style,
                                          style: TextStyle(
                                            fontSize: _selectedWorkoutStyle == style
                                                ? 15 : 14,
                                            color: _selectedWorkoutStyle == style
                                                ? Colors.blueAccent[100]
                                                : Colors.white70,
                                            fontWeight: _selectedWorkoutStyle == style
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  // Goal Selection with SegmentedButton
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepOrange.shade300, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Select your workout goal:',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: workoutGoals.map((goal) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedGoal = goal;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: _selectedGoal == goal
                                            ? Colors.blueAccent[200]
                                                ?.withOpacity(0.8)
                                            : Colors.grey.shade200,
                                        border: Border.all(
                                            color: _selectedGoal == goal
                                                ? Colors.deepOrange[400]!
                                                : Colors.grey,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Text(
                                        goal,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: _selectedGoal == goal
                                              ? Colors.white
                                              : Colors.black54,
                                          fontWeight: _selectedGoal == goal
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // EQUIPMENT SELECTION
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepOrange.shade300, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Select your equipment options:',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 6,
                            runSpacing: 10,
                            children: equipmentOptions.map((equipment) {
                              return RawChip(
                                avatar: null,
                                label: Text(
                                  equipment,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                selected: _selectedEquipment == equipment,
                                onSelected: (selected) {
                                  setState(() {
                                    _selectedEquipment = equipment;
                                  });
                                },
                                selectedColor:
                                    Colors.blueAccent[100]?.withOpacity(0.6),
                                backgroundColor: Colors.grey[300],
                                labelStyle: TextStyle(
                                    color: _selectedEquipment == equipment
                                        ? Colors.black
                                        : Colors.black54),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(
                                    color: _selectedEquipment == equipment
                                        ? Colors.deepOrange.shade300
                                        : Colors.grey,
                                    width: 1,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // DURATION SELECTION
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                      height: 175,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.deepOrange.shade300, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            'Select Workout Duration:',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              _scrollController.animateTo(
                                _scrollController.offset -
                                    -50, // Scroll up by 50 pixels
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const Icon(
                              Icons.arrow_drop_up,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              controller:
                                  _scrollController, // Use custom ScrollController
                              itemExtent:
                                  50, // Set item extent for consistent item height
                              itemCount: workoutDurations.length,
                              physics:
                                  const BouncingScrollPhysics(), // Add some bounce
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedDuration =
                                          workoutDurations[index];
                                    });
                                  },
                                  child: Center(
                                    child: Text(
                                      workoutDurations[index],
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: _selectedDuration ==
                                                workoutDurations[index]
                                            ? Colors.blueAccent
                                            : Colors.grey,
                                        fontWeight: _selectedDuration ==
                                                workoutDurations[index]
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              _scrollController.animateTo(
                                _scrollController.offset -
                                    50, // Scroll up by 50 pixels
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                  const SizedBox(height: 30),
                  //THE GENERATE BUTTON
                  // ElevatedButton(
                  //   onPressed: () {
                  //     // Generate the workout
                  //     final workout = generateWorkout(
                  //       _selectedEquipment,
                  //       selectedGoal: _selectedGoal,
                  //       selectedDuration: _selectedDuration,
                  //     );
                  //     print('Generated workout: $workout');
                  //
                  //     // Navigate to WorkoutDetailsScreen and pass the workout data
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => WorkoutDetailsScreen(
                  //           selectedGoal: _selectedGoal,
                  //           selectedDuration: _selectedDuration,
                  //           selectedEquipment: _selectedEquipment,
                  //           // selectedDaysPerWeek: _selectedDaysPerWeek, // Add this back when needed
                  //           generatedWorkout:
                  //               workout, // Pass the generated workout
                  //         ),
                  //       ),
                  //     );
                  //   },
                  //   child: const Text(
                  //     'Generate My Workout',
                  //     style: TextStyle(
                  //       color: Colors.blueAccent,
                  //       fontSize: 18,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
