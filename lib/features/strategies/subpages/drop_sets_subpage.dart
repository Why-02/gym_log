import 'package:flutter/material.dart';
import 'package:gym_log/core/static_data/strategy_data.dart';
import 'package:gym_log/features/strategies/widgets/styled_strategy_scaffold/styled_strategy_scaffold.dart';

class DropSetsSubpage extends StatelessWidget{
  const DropSetsSubpage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return StyledStrategyScaffold(
      title: "Drop Sets", 
      dataDict: dropSetsDict, 
      imagePath: "assets/images/drop_sets_img.jpg"
    );
  }
}