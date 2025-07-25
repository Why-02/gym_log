import 'package:flutter/material.dart';

class StrategyListTile extends StatelessWidget {
  const StrategyListTile({
    super.key,
    required this.strategyName,
  });

  final String strategyName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ListTile(
        minTileHeight: 80,
        title: Text(strategyName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),),
        leading: Icon(Icons.add, size: 24, color: Colors.deepPurple),
        tileColor: Colors.grey[200],
        textColor: Colors.deepPurple,
      ),
    );
  }
}