/*
Strength:2-5 Reps per exercise. 3-5 Sets per exercise. Rest will be noted as "2-5 minutes"
Hypertrophy: 6-18 Reps per exercise. 2-5 Sets per exercise. Rest will be noted as "1-2 minutes"
Endurance: 10-30 Reps per exercise. 2-3 Sets per exercise. Rest will be noted as "30-90" seconds"
Metabolic: 10-30 Reps per exercise. 2-3 Sets per exercise. Rest will be noted as "10-60 seconds"
I'd like a the random rep count generator to be as follows based on goal
Strength: 50% of time 5 rep, 15% of time 4 rep, 20% of time 3 rep and 15% of time 2 rep.
60% of time 3 sets, 25% of time 4 sets, and 15% of time 5 sets AND if it comes up for 5 sets
it MUST be a Primary Exercise.
Hypertrophy: 60% of time it will be 8, 9, 10, 11, or 12, reps. 15% of time it will be 6 or
7 reps.  15% of time it will be 13-15 reps. And, 10% of time it will be 16-18 reps. 60% of
time 3 Sets, 15% of the time 2 Sets.  15% of time it will be 4 sets. And, 10% of time it
can be 5 sets.
Endurance: 20% of the time 10-14 reps, 40% of time 15-19 reps, 20% of time 20-25 reps,
and 10% of the time the reps can be from 26 -30. 50% of the time should come up 2 sets
and 50% of the time it should come up 3 sets.
Metabolic: 10% of the time 10-14 reps, 30% of time 15-19 reps, 40% of time 20-25 reps, and 20%
of the time the reps can be from 26 -30. 50% of the time should come up 2 sets and 50% of
the time it should come up 3 sets.
When the results are presented to user they will be a single number for each. When you see
a range above it's just the odds that need to be built in that a number within that range is selected.

 */
import 'dart:math';

class SetRepGenerator {
  static Map<String, dynamic> generateExerciseDetails(String goal, bool isPrimary) {
    int sets;
    int reps;
    String rest;

    if (goal == 'Strength') {
      reps = _generateRepsStrength();
      sets = _generateSetsStrength(isPrimary);
      rest = '2-5 minutes';
    } else if (goal == 'Hypertrophy') {
      reps = _generateRepsHypertrophy();
      sets = _generateSetsHypertrophy();
      rest = '1-2 minutes';
    } else if (goal == 'Endurance') {
      reps = _generateRepsEndurance();
      sets = _generateSetsEndurance();
      rest = '30-90 seconds';
    } else if (goal == 'Metabolic') {
      reps = _generateRepsMetabolic();
      sets = _generateSetsMetabolic();
      rest = '10-60 seconds';
    } else {
      // Default values if goal is not recognized
      sets = 3;
      reps = 10;
      rest = '1-2 minutes';
    }

    return {'sets': sets, 'reps': reps, 'rest': rest};
  }

  static int _generateRepsStrength() {
    final random = Random();
    final probability = random.nextInt(100);

    if (probability < 50) {
      return 5;
    } else if (probability < 65) {
      return 4;
    } else if (probability < 85) {
      return 3;
    } else {
      return 2;
    }
  }

  static int _generateSetsStrength(bool isPrimary) {
    final random = Random();
    final probability = random.nextInt(100);

    if (probability < 60) {
      return 3;
    } else if (probability < 85) {
      return 4;
    } else {
      return isPrimary ? 5 : 4; // 5 sets only if primary
    }
  }

  static int _generateRepsHypertrophy() {
    final random = Random();
    final probability = random.nextInt(100);

    if (probability < 60) {
      return random.nextInt(6) + 8; // 8-13
    } else if (probability < 75) {
      return random.nextInt(2) + 6; // 6-7
    } else if (probability < 90) {
      return random.nextInt(3) + 13; // 13-15
    } else {
      return random.nextInt(3) + 16; // 16-18
    }
  }

  static int _generateSetsHypertrophy() {
    final random = Random();
    final probability = random.nextInt(100);

    if (probability < 60) {
      return 3;
    } else if (probability < 75) {
      return 2;
    } else if (probability < 90) {
      return 4;
    } else {
      return 5;
    }
  }

  static int _generateRepsEndurance() {
    final random = Random();
    final probability = random.nextInt(100);

    if (probability < 20) {
      return random.nextInt(5) + 10; // 10-14
    } else if (probability < 60) {
      return random.nextInt(5) + 15; // 15-19
    } else if (probability < 80) {
      return random.nextInt(6) + 20; // 20-25
    } else {
      return random.nextInt(5) + 26; // 26-30
    }
  }

  static int _generateSetsEndurance() {
    final random = Random();
    return random.nextInt(2) + 2; // 2-3
  }

  static int _generateRepsMetabolic() {
    final random = Random();
    final probability = random.nextInt(100);

    if (probability < 10) {
      return random.nextInt(5) + 10; // 10-14
    } else if (probability < 40) {
      return random.nextInt(5) + 15; // 15-19
    } else if (probability < 80) {
      return random.nextInt(6) + 20; // 20-25
    } else {
      return random.nextInt(5) + 26; // 26-30
    }
  }

  static int _generateSetsMetabolic() {
    final random = Random();
    return random.nextInt(2) + 2; // 2-3
  }
}
