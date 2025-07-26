import 'package:flutter/material.dart';
import 'package:gym_log/core/app_routes.dart';
import 'package:gym_log/core/static_data/strategy_data.dart' as strategy_data;
import 'package:gym_log/features/strategies/widgets/styled_list_tile/styled_list_tile.dart';

class StrategiesPage extends StatelessWidget {
  const StrategiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> strategyList = strategy_data.strategyList;

    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('Strategies', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold))),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: ListView.builder(
            itemCount: strategyList.length,
            itemBuilder: (context, index) => StyledListTile(
              tileName: strategyList[index],
              onTap: (){
                switch(index){
                  case 0 : Navigator.of(context).pushNamed(AppRoutes.trainingSplitsPath);
                  case 1 : Navigator.of(context).pushNamed(AppRoutes.progressiveOverloadPath);
                  case 2 : Navigator.of(context).pushNamed(AppRoutes.deloadPath);
                  case 3 : Navigator.of(context).pushNamed(AppRoutes.mindMuscleConnectionPath);
                  case _ : debugPrint("index $index does not have a route yet");
                }
              },
            )
          ),
        ),
      ),
    );
  }
}

