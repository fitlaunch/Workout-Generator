import '../models/exercise.dart';

final List<Exercise> exercises = [
  // Upper Body Push
  Exercise(
    name: 'Pull-Ups',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Pull-Up Bar'],
    description:
        'A challenging bodyweight exercise that builds upper back and arm strength.\n'
            'Palms facing away.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Incline Dumbbell Press',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Bench'],
    description: 'Targets the upper chest and shoulders.',
    position: ['Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Front Squat',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Barbell', 'Dumbbell'],
    description: 'A squat variation that emphasizes the quads and core.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Glute Bridge',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Plate or bar weighted unless part of a superset.'],
    description:
        'A bodyweight exercise that strengthens the glutes and improves hip mobility.',
    position: ['Finisher', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Good Mornings',
    categories: ['Full Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Barbell'],
    description: 'Targets the hamstrings, glutes, and lower back.',
    position: ['Secondary'],
    isAdvanced: false, //should not show up in ss, cs, mini
  ),
  // New No Equipment Bodyweight Exercises
  Exercise(
    name: 'Arnold Press',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells'],
    description:
    'A variation of the shoulder press that engages more muscle fibers by rotating the dumbbells as you lift.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Bottoms-Up Kettlebell Press',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Kettlebells'],
    description:
    'A challenging shoulder press variation that improves grip strength and shoulder stability.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Clapping Push-Ups',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'], // Updated settings
    equipment: [],
    description:
    'An explosive push-up variation that builds power and upper body strength.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Decline Dumbbell Bench Press',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Bench'],
    description:
    'Targets the lower chest muscles more effectively than a flat bench press.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Diamond Push-Ups',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'], // Updated settings
    equipment: [],
    description:
    'A push-up variation that emphasizes the triceps and inner chest.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Incline Dumbbell Flyes',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Bench'],
    description:
    'An isolation exercise that targets the upper chest muscles.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Landmine Press',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Barbell', 'Landmine Attachment'],
    description:
    'A unique pressing movement that challenges the shoulders and core.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Medicine Ball Chest Passes',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Medicine Ball', 'Wall'],
    description:
    'A dynamic exercise that builds chest power and explosiveness.\n'
        'With partner or against wall.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Pike Push-Ups',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'], // Updated settings
    equipment: [],
    description:
    'A challenging push-up variation that targets the shoulders and upper chest.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Spiderman Push-Ups',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'], // Updated settings
    equipment: [],
    description:
    'A push-up variation that adds a core and flexibility challenge by bringing a knee towards the elbow during the movement.',
    position: ['Primary', 'Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Bodyweight Squats',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['BW'],
    equipment: [],
    description:
        'A fundamental lower body exercise that targets the quads, glutes, and hamstrings.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Lunges',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['BW'],
    equipment: [],
    description:
        'Works the legs and glutes unilaterally, improving balance and coordination.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Crunches',
    categories: ['Full Body', 'Anterior', 'Core'],
    settings: ['BW'],
    equipment: [],
    description:
        'A classic core exercise that targets the rectus abdominis (six-pack muscles).',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Russian Twists',
    categories: ['Full Body', 'Anterior', 'Core'],
    settings: ['BW'],
    equipment: [],
    description:
        'Engages the obliques and core for rotational strength and stability.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Bicycle Crunches',
    categories: ['Full Body', 'Anterior', 'Core'],
    settings: ['BW'],
    equipment: [],
    description:
        'A dynamic core exercise that targets both the rectus abdominis and obliques.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),

  Exercise(
    name: 'Australian Pull-Ups',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Low Bar', 'Suspension Trainer'],
    description:
    'A beginner-friendly variation of pull-ups that builds back and bicep strength.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Bent-Over Barbell Row',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Barbell'],
    description:
    'A classic compound exercise for building a strong and thick back.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Face Pulls',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description:
    'An excellent exercise for improving shoulder health and strengthening the rear deltoids and upper back.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Inverted Rows',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Low Bar', 'Suspension Trainer'],
    description:
    'A bodyweight exercise that targets the back muscles and can be adjusted for different difficulty levels.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Lat Pull Downs',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description:
    'A variation of lat pulldowns that can increase lat activation but may put more stress on the shoulders.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'One-Arm Dumbbell Row',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbell', 'Bench'],
    description:
    'A unilateral rowing exercise that allows for a greater range of motion and focuses on each side of the back individually.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),

  Exercise(
    name: 'Reverse Flyes',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Cable Machine'],
    description:
    'An isolation exercise that targets the rear deltoids and upper back muscles.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Seated Cable Rows (Close Grip)',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description:
    'A variation of seated cable rows that emphasizes the middle back muscles.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'T-Bar Row',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['T-Bar Machine', 'Barbell'],
    description:
    'A compound exercise that targets the back muscles with a focus on the lats and traps.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Overhead Tricep Extensions',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbell'],
    description: 'Isolation exercise focusing on the triceps.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true, // Can be part of advanced sets
  ),
  Exercise(
    name: 'Barbell Back Squat',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Barbell'],
    description:
    'A fundamental compound exercise for building lower body strength and muscle mass.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Bulgarian Split Squat',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells (optional)', 'Bench'],
    description:
    'A challenging unilateral exercise that targets the quads, glutes, and improves balance.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Cossack Squat',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells (optional)'],
    description:
    'A dynamic squat variation that improves mobility and strengthens the quads, glutes, and adductors.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Goblet Squat',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbell', 'Kettlebell'],
    description:
    'A squat variation that helps improve form and targets the quads and core.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Jumping Lunges',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: [],
    description:
    'A plyometric exercise that increases the intensity of lunges and builds explosive power.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Lateral Lunges',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: [],
    description:
    'A lunge variation that targets the inner and outer thighs, improving hip mobility and stability.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Reverse Lunges',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells (optional)'],
    description:
    'A lunge variation that places less stress on the knees and can be easier for beginners.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Sissy Squats',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: [],
    description:
    'An advanced squat variation that isolates the quads and requires excellent balance.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Smith Machine Squats',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Smith Machine'],
    description:
    'A guided squat variation that can be helpful for beginners or for lifting heavier weights.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Walking Lunges',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells (optional)'],
    description:
    'A dynamic lunge variation that challenges balance and coordination while working the legs and glutes.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Barbell Deadlift',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Barbell'],
    description:
    'A classic compound exercise that works the entire posterior chain, including the glutes, hamstrings, and lower back.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Glute Ham Raise',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Glute Ham Raise Machine'],
    description:
    'A challenging exercise that targets the hamstrings and glutes, improving hip extension strength.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),

  Exercise(
    name: 'Hip Thrust (with Band)',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Bench', 'Resistance Band'],
    description:
    'A variation of the hip thrust that adds resistance and increases glute activation.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Kettlebell Swings',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Kettlebell'],
    description:
    'A dynamic exercise that builds explosive power and works the posterior chain, particularly the glutes and hamstrings.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Nordic Hamstring Curls',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Partner or secure anchor point'],
    description:
    'A challenging bodyweight exercise that strengthens the hamstrings and improves eccentric strength.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Reverse Hyperextension',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Reverse Hyperextension Machine'],
    description:
    'Targets the glutes, hamstrings, and lower back with a focus on hip extension.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Romanian Deadlift (Dumbbells)',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells'],
    description:
    'A variation of the Romanian deadlift that can be performed with dumbbells, making it more accessible for some individuals.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Single-Leg Glute Bridge',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: [],
    description:
    'A more challenging variation of the glute bridge that isolates one leg at a time, improving glute strength and stability.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Sumo Deadlift',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Barbell'],
    description:
    'A deadlift variation with a wider stance that emphasizes the inner thighs and glutes.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Barbell Bicep Curls',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Barbell'],
    description: 'Compound exercise primarily targeting the biceps.',
    position: ['Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Cable Pulldowns',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description:
        'Excellent exercise for developing the latissimus dorsi (lats).',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Leg Press',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Leg Press Machine'],
    description:
        'A machine-based exercise for strengthening the quads and glutes.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Hamstring Curls',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Leg Curl Machine'],
    description: 'Isolation exercise focusing on the hamstrings.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Front Plank',
    categories: ['Full Body', 'Anterior', 'Core'],
    settings: ['BW', 'Home Gym'],
    equipment: [],
    description:
        'A static exercise that strengthens the core and improves stability.',
    position: ['Finisher'],
    isAdvanced: false, // Not suitable for advanced sets
  ),
  Exercise(
    name: 'Side Plank',
    categories: ['Full Body', 'Anterior', 'Posterior', 'Core'],
    settings: ['BW', 'Home Gym'],
    equipment: [],
    description:
        'Challenges the obliques and core for improved balance and stability.',
    position: ['Finisher'],
    isAdvanced: false,
  ),
  Exercise(
    name: 'Dumbbell Shoulder Press',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells'],
    description: 'Compound exercise targeting the shoulders (deltoids).',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Seated Cable Rows',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description: 'Effective exercise for strengthening the back muscles.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Leg Extensions',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Leg Extension Machine'],
    description: 'Isolation exercise focusing on the quadriceps.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Calf Raises',
    categories: ['Lower Body', 'Squat', 'Posterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells (optional)'],
    description: 'Strengthens the calf muscles. Generally feet directly forward but may point in or out 10 degrees to target a specific head of the calf.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Bird Dog',
    categories: ['Full Body', 'Posterior', 'Core'],
    settings: ['BW'],
    equipment: [],
    description: 'Improves core stability and coordination.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Barbell Hip Thrust',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Barbell', 'Bench'],
    description: 'A powerful exercise for building glute strength and power.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Dumbbell Lateral Raise',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells'],
    description:
        'Isolation exercise targeting the lateral deltoids (side of the shoulders).',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Chin-Ups',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['BW', 'Pro Gym'],
    equipment: ['Chin-Up Bar'],
    description:
        'A challenging bodyweight exercise that emphasizes the lats and biceps. \n'
            'Palms toward your face',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Hack Squat',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Hack Squat Machine'],
    description:
        'A machine-based squat variation that targets the quads and glutes.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),

  Exercise(
    name: 'Decline Push-Ups',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['BW'],
    equipment: [],
    description:
        'A push-up variation that emphasizes the upper chest and shoulders.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Dumbbell Pullover',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbell', 'Bench'],
    description: 'Works the lats, chest, and triceps.',
    position: ['Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Leg Press Calf Raise',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Leg Press Machine'],
    description: 'Strengthens the calf muscles using the leg press machine.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Single-Leg RDL',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells (optional)'],
    description:
        'Challenges balance and strengthens the hamstrings and glutes unilaterally.',
    position: ['Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Side Plank with Leg Raise',
    categories: ['Full Body', 'Anterior', 'Core'],
    settings: ['BW'],
    equipment: [],
    description:
        'Increases the challenge of the side plank by adding a leg raise for improved core strength and stability.',
    position: ['Finisher'],
    isAdvanced: false,
  ),
  Exercise(
    name: 'Dumbbell Bench Press',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Bench'],
    description: 'A versatile compound exercise for chest development.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Close-Grip Lat Pulldown',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description:
        'A variation of the lat pulldown that emphasizes the biceps and lats.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Barbell Front Squat',
    categories: ['Lower Body', 'Squat', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Barbell'],
    description: 'A squat variation that emphasizes the quads and core.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),

  Exercise(
    name: 'Overhead Press',
    categories: ['Upper Body', 'Push', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Barbell'],
    description: 'Builds shoulder strength and stability.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Dumbbell Incline Row',
    categories: ['Upper Body', 'Pull', 'Posterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Bench'],
    description: 'An effective exercise for targeting the upper back muscles.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Romanian Deadlift (RDL)',
    categories: ['Lower Body', 'Hinge', 'Posterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Barbell', 'Dumbbells'],
    description:
        'Targets the hamstrings, glutes, and lower back with a focus on hip hinging.',
    position: ['Primary', 'Secondary'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Box Jumps',
    categories: ['Lower Body', 'Plyo', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Box'],
    description:
        'A plyometric exercise that develops explosive power and improves vertical jump.',
    position: ['Secondary', 'Primary'],
    isAdvanced: true,
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
    categories: ['Cardio', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Jump Rope'],
    description:
        'A cardiovascular exercise that improves coordination and explosiveness and in higher reps a great cardio enhancer.',
    position: ['Warm-up', 'Finisher'],
    isAdvanced: false,
  ),
  Exercise(
    name: 'Ab Wheel Rollout',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Ab Wheel'],
    description:
    'A challenging core exercise that works the entire abdominal region and improves stability.',
    position: ['Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Cable Crunches',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description:
    'A weighted crunch variation that increases the intensity and targets the rectus abdominis.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Decline Crunches',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Decline Bench'],
    description:
    'A crunch variation performed on a decline bench, increasing the difficulty and range of motion.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Dragon Flag',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Bench (optional)'],
    description:
    'An advanced core exercise that requires significant strength and control.',
    position: ['Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Hanging Knee Raises',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Pull-Up Bar'],
    description:
    'A challenging core exercise that works the lower abs and hip flexors.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Hollow Body Hold',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: [],
    description:
    'An isometric core exercise that builds strength and stability in the entire abdominal region.',
    position: ['Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Leg Raises',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Bench (optional)'],
    description:
    'A core exercise that targets the lower abs and hip flexors.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Mountain Climbers',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: [],
    description:
    'A dynamic core exercise that also elevates heart rate and improves cardiovascular fitness.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Pallof Press',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description:
    'An anti-rotation exercise that challenges core stability and strengthens the obliques.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Plank Jacks',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: [],
    description:
    'A variation of the plank that adds a cardiovascular element and increases core activation.',
    position: ['Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Reverse Crunches',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: [],
    description:
    'A core exercise that targets the lower abs more effectively than traditional crunches.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Standing Cable Woodchops',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['Pro Gym'],
    equipment: ['Cable Machine'],
    description:
    'A dynamic core exercise that works the obliques and improves rotational strength.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Suitcase Carry',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbells', 'Kettlebells'],
    description:
    'A functional exercise that challenges core stability and grip strength while walking with weight on one side.',
    position: ['Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Weighted Crunches',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['Home Gym', 'Pro Gym'],
    equipment: ['Dumbbell', 'Weight Plate'],
    description:
    'A weighted variation of crunches that increases the intensity and targets the rectus abdominis.',
    position: ['Secondary', 'Finisher'],
    isAdvanced: true,
  ),
  Exercise(
    name: 'Windshield Wiper',
    categories: ['Core', 'Anterior', 'Full Body'],
    settings: ['BW', 'Home Gym', 'Pro Gym'],
    equipment: ['Pull-Up Bar (optional)'],
    description:
    'A challenging core exercise that works the obliques and requires significant control.',
    position: ['Finisher'],
    isAdvanced: true,
  ),
];
