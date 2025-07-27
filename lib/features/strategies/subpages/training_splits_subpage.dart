import 'package:flutter/material.dart';
import 'package:gym_log/core/app_routes.dart';
import 'package:gym_log/core/static_data/strategy_data.dart' as strategy_data;
import 'package:gym_log/features/strategies/widgets/styled_list_tile/styled_list_tile.dart';

class TrainingSplitsSubpage extends StatelessWidget{
  const TrainingSplitsSubpage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> trainingSplitsList = strategy_data.trainingSplitsList;

    return Scaffold(
      appBar: AppBar(
        title: Text("Training Splits", style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ListView.builder(
            itemCount: trainingSplitsList.length,
            itemBuilder: (context, index) => StyledListTile(
              tileName: trainingSplitsList[index],
              onTap: (){
                switch(index){
                  case 0 : Navigator.of(context).pushNamed(AppRoutes.fullBodyPath);
                  case 1 : Navigator.of(context).pushNamed(AppRoutes.upperLowerPath);
                  case 2 : Navigator.of(context).pushNamed(AppRoutes.pushPullLegsPath);
                  case 3 : Navigator.of(context).pushNamed(AppRoutes.bodyPartPath);
                  case _ : debugPrint("index $index does not have a route yet");
                }
              },
            )
          )
        )
      )
    );
  }
}