import 'package:flutter/material.dart';
import 'package:gym_log/core/static_data/strategy_splits_data.dart';
import 'package:gym_log/features/strategies/widgets/styled_strategy_scaffold/styled_strategy_scaffold.dart';

class PushPullLegsSubSubpage extends StatelessWidget{
  const PushPullLegsSubSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledStrategyScaffold(
      title: "Push-Pull-Legs Split", 
      dataDict: pushPullLegsDict, 
      imagePath: "assets/images/push_pull_legs_img.jpg"
    );
  }
}