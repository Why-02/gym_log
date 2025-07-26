import 'package:flutter/material.dart';
import 'package:gym_log/core/static_data/strategy_data.dart';
import 'package:gym_log/features/strategies/widgets/styled_strategy_scaffold/styled_strategy_scaffold.dart';

class DeloadSubpage extends StatelessWidget{
  const DeloadSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledStrategyScaffold(
      title: "Deload",
      dataDict: deloadDict,
      imagePath: "assets/images/deload_img.jpg"
    );
  }
}