import 'package:flutter/material.dart';
import 'package:git_log/core/static_data/strategy_data.dart' as strategy_data;
import 'package:git_log/features/strategies/widgets/styled_card/styled_card.dart';

class ProgressiveOverloadSubpage extends StatelessWidget {
  const ProgressiveOverloadSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    final progressiveOverloadDict = strategy_data.progressiveOverloadDict;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Progressive Overload", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: progressiveOverloadDict.length,
        itemBuilder: (context, index) {
          final title = progressiveOverloadDict.keys.elementAt(index);
          final content = progressiveOverloadDict.values.elementAt(index);

          if (index == 0){
            return StyledCard(title: title, content: content, imagePath: 'assets/images/progressive_overload_img.jpg', initiallyExpanded: true,);
          }
          else{
            return StyledCard(title: title, content: content);
          }
        },
      ),
    );
  }
}
