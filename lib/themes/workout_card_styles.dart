import 'package:flutter/material.dart';

// Define the CardStyle class
class CardStyle {
  final Color borderColor;
  final double borderWidth;

  const CardStyle({
    required this.borderColor,
    required this.borderWidth,
  });
}

// Define card styles
const defaultCardStyle = CardStyle(
  borderColor: Colors.blue,
  borderWidth: 2.0,
);

const advancedCardStyles = [
  CardStyle(borderColor: Colors.green, borderWidth: 2.0),
  CardStyle(borderColor: Colors.purple, borderWidth: 2.0),
  CardStyle(borderColor: Colors.orange, borderWidth: 2.0),
  CardStyle(borderColor: Colors.blueGrey, borderWidth: 2.0),
  CardStyle(borderColor: Colors.redAccent, borderWidth: 2.0),
  CardStyle(borderColor: Colors.black54, borderWidth: 2.0),
];