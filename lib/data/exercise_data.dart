import '../models/exercise.dart';

final List<Exercise> exercises = [
  // Upper Push
  Exercise(
    name: 'Pull-Ups',
    categories: ['Upper', 'Pull', 'Posterior'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Pull-Up Bar'],
    description:
        'A challenging bodyweight exercise that builds upper back and arm strength.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Incline Dumbbell Press',
    categories: ['Upper', 'Push', 'Anterior'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Bench'],
    description: 'Targets the upper chest and shoulders.',
    position: ['Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Front Squat',
    categories: ['Lower', 'Squat', 'Anterior'],
    settings: ['Pro Gym'],
    equipment: ['Barbell', 'Dumbbell'],
    description: 'A squat variation that emphasizes the quads and core.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Glute Bridge',
    categories: ['Lower', 'Hinge', 'Posterior'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Plate or bar weighted unless part of a superset.'],
    description:
        'A bodyweight exercise that strengthens the glutes and improves hip mobility.',
    position: ['Finisher', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Good Mornings',
    categories: ['Full Body', 'Hinge' 'Posterior'],
    settings: ['Pro Gym'],
    equipment: ['Barbell'],
    description: 'Targets the hamstrings, glutes, and lower back.',
    position: ['Secondary'],
    isAdvanced: false, //should not show up in ss, cs, mini
  ),
  // New No Equipment Bodyweight Exercises
  Exercise(
    name: 'Bodyweight Squats',
    categories: ['Lower', 'Squat', 'Anterior'],
    settings: ['BW'],
    equipment: [],
    description:
        'A fundamental lower body exercise that targets the quads, glutes, and hamstrings.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Lunges',
    categories: ['Lower', 'Squat', 'Anterior'],
    settings: ['BW'],
    equipment: [],
    description:
        'Works the legs and glutes unilaterally, improving balance and coordination.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Crunches',
    categories: ['Full Body', 'Anterior'],
    settings: ['BW'],
    equipment: [],
    description:
        'A classic core exercise that targets the rectus abdominis (six-pack muscles).',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Russian Twists',
    categories: ['Full Body', 'Anterior'],
    settings: ['BW'],
    equipment: [],
    description:
        'Engages the obliques and core for rotational strength and stability.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Bicycle Crunches',
    categories: ['Full Body', 'Anterior'],
    settings: ['BW'],
    equipment: [],
    description:
        'A dynamic core exercise that targets both the rectus abdominis and obliques.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),

  // Additional exercises with updated isAdvanced values
  Exercise(
    name: 'Overhead Tricep Extensions',
    categories: ['Upper', 'Push', 'Anterior'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbell'],
    description: 'Isolation exercise focusing on the triceps.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true, // Can be part of advanced sets
  ),
  Exercise(
    name: 'Barbell Bicep Curls',
    categories: ['Upper', 'Pull', 'Anterior'],
    settings: ['Pro Gym'],
    equipment: ['Barbell'],
    description: 'Compound exercise primarily targeting the biceps.',
    position: ['Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Cable Pulldowns',
    categories: ['Upper', 'Pull', 'Posterior'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description:
        'Excellent exercise for developing the latissimus dorsi (lats).',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Leg Press',
    categories: ['Lower', 'Squat', 'Anterior'],
    settings: ['Pro Gym'],
    equipment: ['Leg Press Machine'],
    description:
        'A machine-based exercise for strengthening the quads and glutes.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Hamstring Curls',
    categories: ['Lower', 'Hinge', 'Posterior'],
    settings: ['Pro Gym'],
    equipment: ['Leg Curl Machine'],
    description: 'Isolation exercise focusing on the hamstrings.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Plank',
    categories: ['Full Body', 'Anterior'],
    settings: ['BW'],
    equipment: [],
    description:
        'A static exercise that strengthens the core and improves stability.',
    position: ['Finisher'],
    isAdvanced: false, // Not suitable for advanced sets
  ),
  Exercise(
    name: 'Side Plank',
    categories: ['Full Body', 'Anterior'],
    settings: ['BW'],
    equipment: [],
    description:
        'Challenges the obliques and core for improved balance and stability.',
    position: ['Finisher'],
    isAdvanced: false,
  ),
  Exercise(
    name: 'Dumbbell Shoulder Press',
    categories: ['Upper', 'Push', 'Anterior'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells'],
    description: 'Compound exercise targeting the shoulders (deltoids).',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Seated Cable Rows',
    categories: ['Upper', 'Pull', 'Posterior'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description: 'Effective exercise for strengthening the back muscles.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Leg Extensions',
    categories: ['Lower', 'Squat', 'Anterior'],
    settings: ['Pro Gym'],
    equipment: ['Leg Extension Machine'],
    description: 'Isolation exercise focusing on the quadriceps.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Calf Raises',
    categories: ['Lower', 'Squat', 'Anterior'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells (optional)'],
    description: 'Strengthens the calf muscles.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Bird Dog',
    categories: ['Full Body', 'Posterior'],
    settings: ['BW'],
    equipment: [],
    description: 'Improves core stability and coordination.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Barbell Hip Thrust',
    categories: ['Lower', 'Hinge', 'Posterior'],
    settings: ['Pro Gym'],
    equipment: ['Barbell', 'Bench'],
    description: 'A powerful exercise for building glute strength and power.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Dumbbell Lateral Raise',
    categories: ['Upper', 'Push', 'Anterior'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells'],
    description:
        'Isolation exercise targeting the lateral deltoids (side of the shoulders).',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Chin-Ups',
    categories: ['Upper', 'Pull', 'Posterior'],
    settings: ['BW', 'Pro Gym'],
    equipment: ['Chin-Up Bar'],
    description:
        'A challenging bodyweight exercise that emphasizes the biceps.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Hack Squat',
    categories: ['Lower', 'Squat', 'Anterior'],
    settings: ['Pro Gym'],
    equipment: ['Hack Squat Machine'],
    description:
        'A machine-based squat variation that targets the quads and glutes.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Single-Leg Romanian Deadlift',
    categories: ['Lower', 'Hinge', 'Posterior'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells (optional)'],
    description:
        'Challenges balance and strengthens the hamstrings and glutes unilaterally.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Decline Push-Ups',
    categories: ['Upper', 'Push', 'Anterior'],
    settings: ['BW'],
    equipment: [],
    description:
        'A push-up variation that emphasizes the upper chest and shoulders.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Dumbbell Pullover',
    categories: ['Upper', 'Pull', 'Posterior'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbell', 'Bench'],
    description: 'Works the lats, chest, and triceps.',
    position: ['Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Leg Press Calf Raise',
    categories: ['Lower', 'Squat', 'Anterior'],
    settings: ['Pro Gym'],
    equipment: ['Leg Press Machine'],
    description: 'Strengthens the calf muscles using the leg press machine.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Single-Leg Deadlifts',
    categories: ['Lower', 'Hinge', 'Posterior'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells (optional)'],
    description:
        'Challenges balance and strengthens the hamstrings and glutes unilaterally.',
    position: ['Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Side Plank with Leg Raise',
    categories: ['Full Body', 'Anterior'],
    settings: ['BW'],
    equipment: [],
    description:
        'Increases the challenge of the side plank by adding a leg raise for improved core strength and stability.',
    position: ['Finisher'],
    isAdvanced: false,
  ),
  Exercise(
    name: 'Dumbbell Bench Press',
    categories: ['Upper', 'Push', 'Anterior'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Bench'],
    description: 'A versatile compound exercise for chest development.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Close-Grip Lat Pulldown',
    categories: ['Upper', 'Pull', 'Posterior'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description:
        'A variation of the lat pulldown that emphasizes the biceps and lats.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Barbell Front Squat',
    categories: ['Lower', 'Squat', 'Anterior'],
    settings: ['Pro Gym'],
    equipment: ['Barbell'],
    description: 'A squat variation that emphasizes the quads and core.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Barbell Hip Thrust',
    categories: ['Lower', 'Hinge', 'Posterior'],
    settings: ['Pro Gym'],
    equipment: ['Barbell', 'Bench'],
    description: 'Builds glute strength and power.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Overhead Press',
    categories: ['Upper', 'Push', 'Anterior'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Barbell'],
    description: 'Builds shoulder strength and stability.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Dumbbell Incline Row',
    categories: ['Upper', 'Pull', 'Posterior'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Bench'],
    description: 'An effective exercise for targeting the upper back muscles.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Romanian Deadlift (RDL)',
    categories: ['Lower', 'Hinge', 'Posterior'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Barbell', 'Dumbbells'],
    description:
        'Targets the hamstrings, glutes, and lower back with a focus on hip hinging.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Box Jumps',
    categories: ['Lower', 'Plyometrics'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Box'],
    description:
        'A plyometric exercise that develops explosive power and improves vertical jump.',
    position: ['Finisher'],
    isAdvanced: false, // Explosive exercise, not suitable for advanced sets
  ),
  Exercise(
    name: 'Renegade Row',
    categories: ['Full Body', 'Anterior', 'Posterior'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells'],
    description:
        'Combines a plank with a row, challenging core stability and upper body strength.',
    position: ['Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Jump Rope',
    categories: ['Cardio'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Jump Rope'],
    description:
        'A cardiovascular exercise that improves coordination and agility.',
    position: ['Warm-up', 'Finisher'],
    isAdvanced: false,
  ),
];
