import 'package:flutter/material.dart';
import 'package:gym_log/config/depencencies.dart';
import 'package:gym_log/core/app_routes.dart';
import 'package:gym_log/core/ui/pages/tab_scaffold.dart';
import 'package:gym_log/features/strategies/strategies_page.dart';
import 'package:gym_log/features/strategies/subpages/deload_subpage.dart';
import 'package:gym_log/features/strategies/subpages/mind_muscle_connection_subpage.dart';
import 'package:gym_log/features/strategies/subpages/progressive_overload_subpage.dart';
import 'package:gym_log/features/strategies/subpages/training_splits_subpage.dart';
import 'package:gym_log/features/workout_logs/workout_logs_page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: homeProviders,child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => TabScaffold(tabs: [
              WorkoutLogsPage(),
              Placeholder(),
              StrategiesPage(),
              Placeholder()
            ]
          ),
        AppRoutes.trainingSplitsPath : (context) => TrainingSplitsSubpage(),
        AppRoutes.progressiveOverloadPath : (context) => ProgressiveOverloadSubpage(),
        AppRoutes.deloadPath : (context) => DeloadSubpage(),
        AppRoutes.mindMuscleConnectionPath : (context) => MindMuscleConnectionSubpage(),
      },
    ));
  }
}