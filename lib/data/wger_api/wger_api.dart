import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/wger_exercise.dart';


Future<void> fetchExercises() async {
  var uriExercise = 'https://wger.de/api/v2/exercise/?language=2';
  final response = await http.get(Uri.parse(uriExercise));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final List<dynamic> exercisesJson = jsonData['results'];
    final List<WgerExercise> exercises = exercisesJson.map((exerciseJson) {
      return WgerExercise.fromJson(exerciseJson, categoryMap, muscleMap, equipmentMap);
    }).toList();

    // Now you have a list of WgerExercise objects
    print(exercises);
  } else {
    // Handle errors
    print('Request failed with status: ${response.statusCode}.');
  }
}

Map<int, String> categoryMap = {};
Map<int, String> muscleMap = {};
Map<int, String> equipmentMap = {};

Future<void> fetchCategories() async {
  final response = await http.get(Uri.parse(
      'https://wger.de/api/v2/exercisecategory/?language=2'));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final List<dynamic> categories = jsonData['results'];
    for (final category in categories) {
      categoryMap[category['id']] = category['name'];
    }
  }
}

Future<void> fetchMuscles() async {
  final response = await http.get(Uri.parse(
      'https://wger.de/api/v2/muscle/?language=2'));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final List<dynamic> muscles = jsonData['results'];
    for (final muscle in muscles) {
      muscleMap[muscle['id']] = muscle['name'];
    }
  }
}

Future<void> fetchEquipment() async {
  final response = await http.get(Uri.parse(
      'https://wger.de/api/v2/equipment/?language=2'));
  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    final List<dynamic> equipment = jsonData['results'];
    for (final equipmentItem in equipment) {
      equipmentMap[equipmentItem['id']] = equipmentItem['name'];
    }
  }
}