import 'package:flutter/material.dart';
import 'package:gym_log/core/static_data/strategy_splits_data.dart';
import 'package:gym_log/features/strategies/widgets/styled_strategy_scaffold/styled_strategy_scaffold.dart';

class FullBodySubSubpage extends StatelessWidget{
  const FullBodySubSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledStrategyScaffold(
      title: 'Full-Body', 
      dataDict: fullBodyDict, 
      imagePath: "assets/images/full_body_img.jpg"
    );
  }
}