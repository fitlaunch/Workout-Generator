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

// const advancedCardStyle = CardStyle(
// borderColor: Colors.green,
// borderWidth: 2.0,
// );



const advancedCardStyle = [
  CardStyle(borderColor: Colors.green, borderWidth: 2.0),
  CardStyle(borderColor: Colors.purple, borderWidth: 2.0),
  CardStyle(borderColor: Colors.orange, borderWidth: 2.0),
  CardStyle(borderColor: Colors.blueGrey, borderWidth: 2.0),
  CardStyle(borderColor: Colors.redAccent, borderWidth: 2.0),
  CardStyle(borderColor: Colors.black54, borderWidth: 2.0),
];

final BoxDecoration greenStyle = BoxDecoration(
  color: Colors.green,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2)),
  ],
);

final BoxDecoration blueStyle = BoxDecoration(
  color: Colors.blue,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2)),
  ],
);

final BoxDecoration orangeStyle = BoxDecoration(
  color: Colors.orange,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2)),
  ],
);

final BoxDecoration redStyle = BoxDecoration(
  color: Colors.red,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2)),
  ],
);

final BoxDecoration purpleStyle = BoxDecoration(
  color: Colors.purple,
  borderRadius: BorderRadius.circular(8),
  boxShadow: [
    BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 4, offset: const Offset(0, 2)),
  ],
);