List<String> strategyList = [
  "Training Splits",
  "Progressive Overload",
  "Deloads",
  "Mind-Muscle Connection",
  "Time Under Tension",
  "Contrast Training",
  "Drop Sets",
  "Supersets",
];

List<String> trainingSplitsList = [
  "Full Body",
  "Upper/Lower",
  "Push/Pull/Legs",
  "Body Part",
];

Map<String, String> progressiveOverloadDict = {
  "Idea": '''
  - A training principle where the stress place on the body is gradually increased over time
  - It prevents the body from fully adapting to your current workout routing
  - It helps avoid plateaus in muscle growth and strength gains
  ''',

  "Simple Form": '''
  The simplest form of progressive overload is to increase the weight of exercises by 2.5 kg each week.
  This is easy to implement since most gym machines allow the addition of up to two small plates of 2.5 kg.

  If you're unable to increase the weight by 2.5 kg, consider adding 1 or 2 extra reps instead.
  The following week, return to your original rep count and attempt to increase the weight again as planned.
  ''',

  "Volume-Based Form": '''
  This form is a more general one where you increase the volume of training over time. 

  Volume = Sets * Reps * Weight

  This means to increase the volume, you do not have to increase the weight. You can:
  - increase the number of sets between a week and the next one (ex: from 3 to 4)
  - increase the number of reps between a week and the next one (ex: from 8 to 10)
  - increase the weight between a week and the next one (ex: from 40kg to 42.5kg)

  This method works well for hypertrophy and managing fatigue while still promoting overload.
  '''
};

Map<String, String> deloadDict = {
  "idea": '''
  - it is important to take a deloading week from time to time
  - usually, you can take a deloading week once every 6 to 8 weeks
  - during deloading, decrease the intensity of your workout to 60 or 70%. 
  - Ex:
    - number of sets is halfed
    - number of reps stays the same
    - weight comes down to 70% of the usual weigth carried
  '''
};

Map<String, String> mindMuscleConnectionDict = {
  "idea": '''
  - This strategy is about mentally focusing on the muscle you are activating during the exercice
  - It makes you less likely to let other muscles compensate, which improves technique and activation while reducing  the risk of injury
  
  ''',
  "Implementation": '''
  - Practice Mind-Muscle Connection by:
    - Slowing down reps to focus on the tension in the muscle
    - Using lower weights when necessary to focus on control and technique
    - Visualize the muscle shortening and lengthening
    - tap or touch the muscle to make check its activation in exercices where this is possible
  '''
};