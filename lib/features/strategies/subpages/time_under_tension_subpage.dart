import 'package:flutter/material.dart';
import 'package:gym_log/core/static_data/strategy_data.dart';
import 'package:gym_log/features/strategies/widgets/styled_strategy_scaffold/styled_strategy_scaffold.dart';

class TimeUnderTensionSubpage extends StatelessWidget{
  const TimeUnderTensionSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledStrategyScaffold(
      title: "Time Under Tension", 
      dataDict: timeUnderTensionDict, 
      imagePath: "assets/images/time_under_tension_img.jpg"
    );
  }
}