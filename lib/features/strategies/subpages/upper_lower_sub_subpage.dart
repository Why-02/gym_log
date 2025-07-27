import 'package:flutter/material.dart';
import 'package:gym_log/core/static_data/strategy_splits_data.dart';
import 'package:gym_log/features/strategies/widgets/styled_strategy_scaffold/styled_strategy_scaffold.dart';

class UpperLowerSubSubpage extends StatelessWidget{
  const UpperLowerSubSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledStrategyScaffold(
      title: "Upper-Lower Split", 
      dataDict: upperLowerDict, 
      imagePath: "assets/images/upper_lower_img.jpg"
    );
  }
}