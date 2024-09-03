import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../themes/workout_card_styles.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final CardStyle cardStyle;
  final Color? iconColor;
  final bool isIndented;

  const ExerciseCard({
    super.key,
    required this.exercise,
    required this.cardStyle,
    this.iconColor,
    this.isIndented = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(left: isIndented ? 16.0 : 0.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(
            color: cardStyle.borderColor,
            width: cardStyle.borderWidth,
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(exercise.name,
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('Category: ${exercise.categories.join(', ')}'),
                    Text('Equipment: ${exercise.equipment.join(', ')}'),
                    if (exercise.description != null)
                      Text('Description: ${exercise.description}'),
                    // Conditionally display sets and reps based on exercise type
                    if (exercise.position.contains('Primary') ||
                        !exercise.isAdvancedSet)
                      const Text('Sets: 3, Reps: 10')
                    else if (exercise.position.contains('Finisher'))
                      const Text('Sets: 3, Reps: 15')
                    else if (exercise.isAdvancedSet)
                        const Text('Sets: 3, Reps: 12-15'),
                  ],
                ),
              ),
              // Show the icon for advanced sets (mini-circuit)
              if (exercise.isAdvancedSet)
                  //&& exercise.advancedSetType == 'mini-circuit')
                //Icon(Icons.swap_horiz, color: iconColor),
                Icon(
                  exercise.advancedSetType == 'mini-circuit'
                      ? Icons.swap_vert
                      : Icons.swap_horiz, // Or a suitable icon for superset
                  color: iconColor,
                ),
              // Icon(
              //   exercise.advancedSetType == 'superset'
              //       ? Icons.swap_vert
              //       : Icons.fitness_center, // Or a suitable icon for superset
              //   color: iconColor,
              // ),
            ],
          ),
        ),

      ),
    );
  }
}