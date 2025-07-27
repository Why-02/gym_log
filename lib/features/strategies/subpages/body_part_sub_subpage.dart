import 'package:flutter/widgets.dart';
import 'package:gym_log/core/static_data/strategy_splits_data.dart';
import 'package:gym_log/features/strategies/widgets/styled_strategy_scaffold/styled_strategy_scaffold.dart';

class BodyPartSubSubpage extends StatelessWidget{
  const BodyPartSubSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledStrategyScaffold(
      title: "Body-Part Split", 
      dataDict: bodyPartDict, 
      imagePath: "assets/images/body_part_img.jpg"
    );
  }
}