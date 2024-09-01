import 'package:workout_generator/data/workout_templates.dart';

/// Selects the appropriate workout template based on the provided goal, duration, and setting.
///
/// Returns the selected template as a `List<String>` representing the exercise positions.
/// If no matching template is found, returns an empty list.
List<String> getTemplateByKey(String setting, String goal, String duration) {
  // Remove "or less" and "min" from duration, and spaces from all inputs
  String cleanedDuration = duration.replaceAll(RegExp(r'\s?or\sless'), '');
  cleanedDuration =
      '${cleanedDuration.replaceAll(' ', '').replaceAll(RegExp(r'mins?$'), '')}min';

  //.replaceAll(RegExp(r'\s?mis?'), 'min')

  // Map user-facing goals to shortened versions
  String goalKey = goal.toLowerCase();
  if (goalKey == 'strength') {
    goalKey = 'strength';
  } else if (goalKey == 'hypertrophy') {
    goalKey = 'hyper';
  } else if (goalKey == 'endurance') {
    goalKey = 'endur';
  } else if (goalKey == 'metabolic') {
    goalKey = 'meto';
  }

  String templateKey = goalKey +
      cleanedDuration +
      (setting == 'Pro Gym'
          ? 'progym'
          : setting.toLowerCase().replaceAll(' ', ''));

  print('Received setting in getTemplateByKey: $setting');
  print('Input values: setting=$setting, goal=$goal, duration=$duration');
  print('Generated templateKey: $templateKey');

  switch (templateKey.toLowerCase()) {
    case 'strength15minhomegym':
      return strength15minhomegym; // lowercase
    case 'strength30minhomegym':
      return strength30minhomegym; // lowercase
    case 'strength60minhomegym':
      return strength60minhomegym; // lowercase
    case 'strength90minhomegym':
      return strength90minhomegym; // lowercase
    case 'hyper15minhomegym':
      return hyper15minhomegym; // lowercase
    case 'hyper30minhomegym':
      return hyper30minhomegym; // lowercase
    case 'hyper60minhomegym':
      return hyper60minhomegym; // lowercase
    case 'hyper90minhomegym':
      return hyper90minhomegym; // lowercase
    case 'endur15minhomegym':
      return endur15minhomegym; // lowercase
    case 'endur30minhomegym':
      return endur30minhomegym; // lowercase
    case 'endur60minhomegym':
      return endur60minhomegym; // lowercase
    case 'endur90minhomegym':
      return endur90minhomegym; // lowercase
    case 'meto15minhomegym':
      return meto15minhomegym; // lowercase
    case 'meto30minhomegym':
      return meto30minhomegym; // lowercase
    case 'meto60minhomegym':
      return meto60minhomegym; // lowercase
    case 'meto90minhomegym':
      return meto90minhomegym; // lowercase
    // PROFESSIONAL GYM EQUIPMENT ACCESS
    case 'strength15minprogym':
      return strength15minprogym; // lowercase
    case 'strength30minprogym':
      return strength30minprogym; // lowercase
    case 'strength60minprogym':
      return strength60minprogym; // lowercase
    case 'strength90minprogym':
      return strength90minprogym; // lowercase
    case 'hyper15minprogym':
      return hyper15minprogym; // lowercase
    case 'hyper30minprogym':
      return hyper30minprogym; // lowercase
    case 'hyper60minprogym':
      return hyper60minprogym; // lowercase
    case 'hyper90minprogym':
      return hyper90minprogym; // lowercase
    case 'endur15minprogym':
      return endur15minprogym; // lowercase
    case 'endur30minprogym':
      return endur30minprogym; // lowercase
    case 'endur60minprogym':
      return endur60minprogym; // lowercase
    case 'endur90minprogym':
      return endur90minprogym; // lowercase
    case 'meto15minprogym':
      return meto15minprogym; // lowercase
    case 'meto30minprogym':
      return meto30minprogym; // lowercase
    case 'meto60minprogym':
      return meto60minprogym; // lowercase
    case 'meto90minprogym':
      return meto90minprogym; // lowercase
    // BODY WEIGHT FOR EQUIPMENT ONLY
    case 'strength15minbw':
      return strength15minbw; // lowercase
    case 'strength30minbw':
      return strength30minbw; // lowercase
    case 'strength60minbw':
      return strength60minbw; // lowercase
    case 'strength90minbw':
      return strength90minbw; // lowercase
    case 'hyper15minbw':
      return hyper15minbw; // lowercase
    case 'hyper30minbw':
      return hyper30minbw; // lowercase
    case 'hyper60minbw':
      return hyper60minbw; // lowercase
    case 'hyper90minbw':
      return hyper90minbw; // lowercase
    case 'endur15minbw':
      return endur15minbw; // lowercase
    case 'endur30minbw':
      return endur30minbw; // lowercase
    case 'endur60minbw':
      return endur60minbw; // lowercase
    case 'endur90minbw':
      return endur90minbw; // lowercase
    case 'meto15minbw':
      return meto15minbw; // lowercase
    case 'meto30minbw':
      return meto30minbw; // lowercase
    case 'meto60minbw':
      return meto60minbw; // lowercase
    case 'meto90minbw':
      return meto90minbw; // lowercase
    // ... Add more cases for other combinations of goal, duration, and setting
    default:
      // Handle the case where no matching template is found
      print(
          'No template found for: Goal: $goal, Duration: $duration, Setting: $setting');
      return [];
  }
}
