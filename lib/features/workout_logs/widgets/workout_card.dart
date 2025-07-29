import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final Map<String,dynamic> data;
  final List<int> reps;
  final List<int> weights;
  WorkoutCard({super.key, required this.data}):
    reps = [for (dynamic a in data["reps"]) a as int ],
    weights = [for (dynamic a in data["weights"]) a as int];
  @override
  Widget build(BuildContext context) {
    double WIDTH = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width:0.8*WIDTH,
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(border:Border(bottom:BorderSide(), right: BorderSide())),
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Align(alignment: Alignment.topLeft,child: Text( "${data['log_date']}")),
              for (int i =0; i < reps.length; i++)
                Text("\u2022 Set $i: #reps: ${reps[i]}, weight:${weights[i]}")
            ],)
        ),
      ),
    );
  }
}