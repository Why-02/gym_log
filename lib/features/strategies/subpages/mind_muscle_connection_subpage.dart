import 'package:flutter/material.dart';
import 'package:git_log/core/static_data/strategy_data.dart';
import 'package:git_log/features/strategies/widgets/styled_strategy_scaffold/styled_strategy_scaffold.dart';

class MindMuscleConnectionSubpage extends StatelessWidget{
  const MindMuscleConnectionSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledStrategyScaffold(
      title: "Mind-Muscle Connection", 
      dataDict: mindMuscleConnectionDict, 
      imagePath: "assets/images/mind_muscle_connection_img.jpg"
    );
  }
}