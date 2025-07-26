import 'package:flutter/material.dart';
import 'package:git_log/features/workout_logs/widgets/workout_adder.dart';
import 'package:git_log/features/workout_logs/widgets/workout_logs_header.dart';

class WorkoutLogsPage extends StatefulWidget {
  const WorkoutLogsPage({super.key});

  @override
  State<WorkoutLogsPage> createState() => _WorkoutLogsPageState();
}

class _WorkoutLogsPageState extends State<WorkoutLogsPage> {

  List<WorkoutAdder> workouts = [WorkoutAdder()];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:Column(
        children: [
          WorkoutLogsHeader(),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
            height:800,
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: workouts.length,
              itemBuilder: (context, index){
              return workouts[workouts.length - index - 1];
            }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        setState(() {
          workouts.insert(0,WorkoutAdder());
        });
        
        
      },child:Icon(Icons.add)
      ),
    );
  }
}