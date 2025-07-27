import 'package:flutter/material.dart';
import 'package:gym_log/core/static_data/strategy_data.dart';
import 'package:gym_log/features/strategies/widgets/styled_strategy_scaffold/styled_strategy_scaffold.dart';

class ContrastTrainingSubpage extends StatelessWidget{
  const ContrastTrainingSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledStrategyScaffold(
      title: "Contrast Training",
      dataDict: contrastTrainingDict,
      imagePath: "assets/images/contrast_training_img.jpg"
    );
  }
}