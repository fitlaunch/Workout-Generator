class WgerExercise {
  final int id;
  final String name;
  final String description;
  final String category;
  final List<String> muscles; // List of muscle names
  final List<String> musclesSecondary; // List of secondary muscle names
  final List<String> equipment; // List of equipment names

  WgerExercise({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.muscles,
    required this.musclesSecondary,
    required this.equipment,
  });

  factory WgerExercise.fromJson(Map<String, dynamic> json,
      Map<int, String> categoryMap,
      Map<int, String> muscleMap,
      Map<int, String> equipmentMap) {

    final categoryName = categoryMap[json['category']];

    final muscles = (json['muscles'] as List<dynamic>)
        .map((muscleId) => muscleMap[muscleId] ?? 'Unknown Muscle')
        .toList();

    final musclesSecondary = (json['muscles_secondary'] as List<dynamic>)
        .map((muscleId) => muscleMap[muscleId] ?? 'Unknown Muscle')
        .toList();

    final equipment = (json['equipment'] as List<dynamic>)
        .map((equipmentId) => equipmentMap[equipmentId] ?? 'Unknown Equipment')
        .toList();

    return WgerExercise(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      category: categoryName ?? 'Unknown Category',
      muscles: muscles,
      musclesSecondary: musclesSecondary,
      equipment: equipment,
    );
  }
}