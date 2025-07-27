import 'package:flutter/material.dart';
import 'package:gym_log/core/static_data/strategy_data.dart';
import 'package:gym_log/features/strategies/widgets/styled_strategy_scaffold/styled_strategy_scaffold.dart';

class SupersetsSubpage extends StatelessWidget{
  const SupersetsSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledStrategyScaffold(
      title: "Supersets", 
      dataDict: supersetsDict, 
      imagePath: "assets/images/supersets_img.jpg"
    );
  }
}