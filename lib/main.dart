import 'package:flutter/material.dart';
import 'package:gym_log/core/ui/pages/tab_scaffold.dart';
import 'package:gym_log/features/strategies/strategies_page.dart';
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
      home: TabScaffold(
        tabs: [
          WorkoutLogsPage(),
          Placeholder(),
          StrategiesPage(),
          Placeholder()
        ]
      ),
    );
  }
}