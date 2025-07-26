import 'package:flutter/material.dart';
import 'package:git_log/core/static_data/strategy_data.dart' as strategy_data;
import 'package:git_log/features/strategies/widgets/styled_list_tile/styled_list_tile.dart';

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
              onTap: () => debugPrint(index.toString()),
            )
          ),
        ),
      ),
    );
  }
}

