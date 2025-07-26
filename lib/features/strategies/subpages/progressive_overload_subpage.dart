import 'package:flutter/material.dart';
import 'package:gym_log/core/static_data/strategy_data.dart';
import 'package:gym_log/features/strategies/widgets/styled_strategy_scaffold/styled_strategy_scaffold.dart';

class ProgressiveOverloadSubpage extends StatelessWidget {
  const ProgressiveOverloadSubpage({super.key});

  @override
  Widget build(BuildContext context) {

    return StyledStrategyScaffold(
      title: "Progressive Overload", 
      dataDict: progressiveOverloadDict, 
      imagePath: "assets/images/progressive_overload_img.jpg"
    );
  }
}
