import 'package:flutter/material.dart';
import 'package:gym_log/features/strategies/widgets/styled_card/styled_card.dart';

class StyledStrategyScaffold extends StatelessWidget{
  final String title;
  final Map<String, String> dataDict;
  final String imagePath;

  const StyledStrategyScaffold({
    super.key, 
    required this.title,
    required this.dataDict,
    required this.imagePath
  });

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: dataDict.length,
        itemBuilder: (context, index) {
          final title = dataDict.keys.elementAt(index);
          final content = dataDict.values.elementAt(index);

          if (index == 0){
            return StyledCard(title: title, content: content, imagePath: imagePath, initiallyExpanded: true,);
          }
          else{
            return StyledCard(title: title, content: content);
          }
        },
      ),
    );
  }
}