import 'package:flutter/material.dart';
import 'package:gym_log/core/app_routes.dart';
import 'package:gym_log/core/ui/pages/tab_scaffold.dart';
import 'package:gym_log/features/profile/profile_page.dart';
import 'package:gym_log/features/strategies/strategies_page.dart';
import 'package:gym_log/features/strategies/subpages/body_part_sub_subpage.dart';
import 'package:gym_log/features/strategies/subpages/contrast_training_subpage.dart';
import 'package:gym_log/features/strategies/subpages/deload_subpage.dart';
import 'package:gym_log/features/strategies/subpages/drop_sets_subpage.dart';
import 'package:gym_log/features/strategies/subpages/full_body_sub_subpage.dart';
import 'package:gym_log/features/strategies/subpages/mind_muscle_connection_subpage.dart';
import 'package:gym_log/features/strategies/subpages/progressive_overload_subpage.dart';
import 'package:gym_log/features/strategies/subpages/push_pull_legs_sub_subpage.dart';
import 'package:gym_log/features/strategies/subpages/supersets_subpage.dart';
import 'package:gym_log/features/strategies/subpages/time_under_tension_subpage.dart';
import 'package:gym_log/features/strategies/subpages/training_splits_subpage.dart';
import 'package:gym_log/features/strategies/subpages/upper_lower_sub_subpage.dart';
import 'package:gym_log/features/workout_logs/workout_logs_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: AppRoutes.tabPath,
      routes: {
        AppRoutes.tabPath : (context) => TabScaffold(tabs: [
            WorkoutLogsPage(),
            Placeholder(),
            StrategiesPage(),
            ProfilePage()
          ]
        ),
        
        // Strategies Routes
        AppRoutes.trainingSplitsPath : (context) => TrainingSplitsSubpage(),
        AppRoutes.progressiveOverloadPath : (context) => ProgressiveOverloadSubpage(),
        AppRoutes.deloadPath : (context) => DeloadSubpage(),
        AppRoutes.mindMuscleConnectionPath : (context) => MindMuscleConnectionSubpage(),
        AppRoutes.timeUnderTensionPath : (context) => TimeUnderTensionSubpage(),
        AppRoutes.contrastTrainingPath : (context) => ContrastTrainingSubpage(),
        AppRoutes.dropSetsPath : (context) => DropSetsSubpage(),
        AppRoutes.supersetsPath : (context) => SupersetsSubpage(),

        // Strategies/Training_Splits Routes
        AppRoutes.fullBodyPath : (context) => FullBodySubSubpage(),
        AppRoutes.upperLowerPath : (context) => UpperLowerSubSubpage(),
        AppRoutes.pushPullLegsPath : (context) => PushPullLegsSubSubpage(),
        AppRoutes.bodyPartPath : (context) => BodyPartSubSubpage(),
      },
    );
  }
}