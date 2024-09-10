class Exercise {
  final String name;
  final List<String>
      categories; // Allow multiple categories ie upPush, upPull, etc
  final List<String>
      settings; // exercise equipment setting ie home gym bodyweight
  final List<String> equipment; //bar, band, bodyweight etc
  final String? description; // Optional description
  final String? videoLink; // Optional video link
  final String? image; // Optional image
  final List<String> position; // where in workout ex may fit
  bool isAdvanced = false; //when false, may be used as ss, cs, mini
  bool finisherOnly = false;
  bool isAdvancedSet = false; // Add this property
  String? advancedSetType; // Add this property

  // We'll handle sets and reps later, likely in the workout generation logic

  Exercise({
    required this.name,
    required this.categories,
    required this.settings,
    required this.equipment,
    this.description,
    this.videoLink,
    this.image,
    required this.position,
    this.isAdvanced = false,
    this.finisherOnly = false,
    this.isAdvancedSet = false,
    this.advancedSetType
  });

  Exercise copyWith({
    String? name,
    List<String>? categories,
    List<String>? settings,
    List<String>? equipment,
    List<String>? position,
    String? description,
    String? videoLink,
    String? image,
    bool? finisherOnly,
    bool? isAdvanced,
    bool? isAdvancedSet,
    String? advancedSetType

  }) {
    return Exercise(
      name: name ?? this.name,
      categories: categories ?? this.categories,
      settings: settings ?? this.settings,
      equipment: equipment ?? this.equipment,
      position: position ?? this.position,
      description: description ?? this.description,
      videoLink: videoLink ?? this.videoLink,
      image: image ?? this.image,
      finisherOnly: finisherOnly ?? this.finisherOnly,
      isAdvanced: isAdvanced ?? this.isAdvanced,
      isAdvancedSet: isAdvancedSet ?? this.isAdvancedSet,
      advancedSetType: advancedSetType ?? this.advancedSetType
    );
  }
}

// ... (Exercise class definition)
