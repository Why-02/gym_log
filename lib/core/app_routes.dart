class AppRoutes {
  static String tabPath = '/';

  // Strategies Paths
  static String trainingSplitsPath = '/strategies/training_splits';
  static String progressiveOverloadPath = '/strategies/progressive_overload';
  static String deloadPath = '/strategies/deload';
  static String mindMuscleConnectionPath = '/strategies/mind_muscle_connection';
  static String timeUnderTensionPath = '/strategies/time_under_tension';
  static String contrastTrainingPath = '/strategies/contrast_training';
  static String dropSetsPath = '/strategies/drop_sets';
  static String supersetsPath = '/strategies/supersets';
  
  // Strategies/TrainingSplits paths
  static String fullBodyPath = '$trainingSplitsPath/full_body';
  static String upperLowerPath = '$trainingSplitsPath/upper_lower';
  static String pushPullLegsPath = '$trainingSplitsPath/push_pull_legs';
  static String bodyPartPath = '$trainingSplitsPath/body_part';
}