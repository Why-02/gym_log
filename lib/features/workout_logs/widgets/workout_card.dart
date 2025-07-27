import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final Map<String,Object?> data;
  const WorkoutCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Column(
          children: [
            Text('${data["log_id"]}'),
            Text('${data["exercise_id"]}'),
            Text('${data["log_date"]}'),

          ],)
      ),
    );
  }
}