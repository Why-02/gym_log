import 'package:flutter/material.dart';
import 'package:git_log/core/static_data/strategy_data.dart' as strategy_data;

class ProgressiveOverloadSubpage extends StatelessWidget{
  const ProgressiveOverloadSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, String> progressiveOverloadDict = strategy_data.progressiveOverloadDict;

    return Scaffold(
      appBar: AppBar(
        title: Text("Progressive Overload"),
      ),
      body: ListView.builder(
        itemCount: progressiveOverloadDict.length,
        itemBuilder: (context, index) => Card(
          margin: EdgeInsets.all(8.0),
          child: Column(children: [
            Text(
              progressiveOverloadDict.keys.elementAt(index), 
              style: TextStyle(
                fontSize: 32, 
                fontWeight: FontWeight.w400,
                color: Colors.deepPurple
              ),
            ),
            Text(
              progressiveOverloadDict.values.elementAt(index), 
              style: TextStyle(
                fontSize: 16
              )
            )
          ],),
        ),
      )
    );
  }
}