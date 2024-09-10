import 'package:flutter/material.dart';
import '../models/exercise.dart';
import '../themes/workout_card_styles.dart';

class ExerciseCard extends StatelessWidget {
  final Exercise exercise;
  final CardStyle cardStyle;
  // final Color? iconColor;
  final bool isIndented;
  final String? advancedSetGroup;
  final Icon? icon;

  const ExerciseCard({
    required this.exercise,
    required this.cardStyle,
    this.icon,
    //  this.iconColor,
    this.advancedSetGroup,
    this.isIndented = false,
  }) : super();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      margin: EdgeInsets.only(left: isIndented ? 16.0 : 0.0),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          side: BorderSide(
            color: cardStyle.borderColor,
            width: cardStyle.borderWidth,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (isIndented) const SizedBox(width: 20.0), // Indentation


                  const SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      exercise.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  if (icon != null) icon!, // Display icon if provided
                  if (advancedSetGroup != null)
                  Text(
                    '($advancedSetGroup)', // Display advanced set group
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              if (exercise.equipment.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Equipment: ${exercise.equipment.join(', ')}',
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
