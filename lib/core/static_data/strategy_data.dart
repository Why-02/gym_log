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
  "Upper-Lower",
  "Push-Pull-Legs",
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

Map<String, String> timeUnderTensionDict = {
  "idea": '''
  - can be abbreviated to TUT
  - refers to the total duration your muscles are actively working during a set. 
  - usually measured in seconds per set
  - plays a major role in muscle growth and endurance building
  ''',

  "Repetition Phases" : '''
  Each repetition in a set has 3 phases:
  - **Engagement Phase:** when you are using the muscle to lift/move the weights 
  - **Pausing Phase:** when you hold the weight in place while maintaining muscle engagement
  - **Disengagement Phase:** when you are releasing the muscle from carrying the weight
  ''',

  "Repetition Phases Standard terminology": '''
  The terms in the section above are designed for readability and to easily assimilating the ideas.
  However, the repetition phases have more standard names:
  - **Eccentric Phase:** can be an engagement or disengagement phase depending on exercice
  - **Isometric Hold Phase:** the standard terminology for the pausing phase
  - **Concentric Phase:** if the Eccentric Phase is the engagement phase, then this would be the disengagement one and vice-versa
  ''',

  "TUT m-n-p": '''
  a TUT (time under tension) notation of m-n-p means:
  - m seconds of Engagement
  - n seconds of Pausing
  - p seconds of Disengagement

  This leads to 1 rep taking: m + n + p seconds
  You TUT for the set can be calculated as:
  (m + n + p) * number of reps [in seconds/set]

  Most common TUTs are betweem 40 and 70 seconds per  set
  ''',

  "TUT 4-1-2": '''
  a TUT 4-1-2 means:
  - 4 seconds of Engagement 
  - 1 second of Pausing
  - 2 seconds of Disengagement

  This means 7 seconds per rep.

  For a set of 10 reps, this would mean a TUT of 70 seconds/set.
  ''',

  "TUT durations": '''
  Depending on the Goal, you can choose different TUT notations and durations 

  | Goal | TUT per set | Common TUT Notations | Reps per set |
  | ---- | ----------- | ------------------- | ------------ |
  | Explosive Strength | 10 - 30 sec | 2-0-1 or 1-0-1 | 3 - 6|
  | Hypertrophy | 40 - 70 sec | 4-1-2 or 3-0-3 | 8 - 12 |
  | Endurance | 70 - 120 sec | 3-1-3 or 2-0-2 | 15 - 30 |
  '''
};

Map<String, String> contrastTrainingDict = {
  "idea": '''
  - A popular technique for advanced lifters and athletes
  - Involves pairing two exercises:
    - One heavy strength movement (e.g. squat, bench press)
    - One explosive movement targeting the same muscle group (e.g. jump squat, plyometric push-up)
  - The goal is to prepare your nervous system for explosiveness with the heavy exercise, then unleash it with the explosive movement
  - This trains your muscles to become more responsive and powerful following a near-maximal effort, a phenomenon known as Post-Activation Potentiation (PAP)
  ''',
};

Map<String, String> dropSetsDict = {
  "idea": '''
  - flow :
    - performing an exercice until you reach muscle failure
    - then immediately reducing the weight and continuing with more reps without resting
    - you repeat the process many times, each time reducing the weight and going till failure
  - allows to do more work in less time
  - ideal for breaking plateus
  - should be limited to 1 or 2 times per week to avoid overtraining and injury
  ''',

  "example": '''
  The following are all done back-to-back, until failure, no rest between sets:
  - Curl 20 kg dumbbells for 6 to 8 reps 
  - Drop to 15 kg → do 10 to 12 reps
  - Drop to 12 kg → do 12 to 15 reps 
  ''',

  "tips": '''
  - prepare your weights ahead of time to minimize rest time in the drop set
  - keep focus on your form even when fatigued
  - avoid using drop sets on complicated or dangerous exercices (if you can get crushed, for example)
  '''
};

Map<String, String> supersetsDict = {
  "idea": '''
  - perform two exercices back to back with little to no rest between them
  - this allows for better time-efficiency, while building endurance and muscle strength
  ''',

  "Agonistic Supersets": '''
  A subtype of supersets where both exercices are focused on same muscle group.

  Ex: Bench Press + Dumbell Fly (chest)
  ''',

  "Antagonistic Supersets": '''
  A subtype of supersets where the two exercices focus on opposing muscle groups

  Ex: Biceps Curls + Triceps Extension
  ''',
};

